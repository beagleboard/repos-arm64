#  Copyright (C) 2021 Texas Instruments Incorporated - http://www.ti.com/
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions
#  are met:
#
#    Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
#    Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the
#    distribution.
#
#    Neither the name of Texas Instruments Incorporated nor the names of
#    its contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
#  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
#  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
#  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
#  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
#  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

from time import sleep, time
import threading
import curses
import signal
import sys
import argparse
import yaml
import os

report_list = []
print_stdout = False
stop_reporting_loop = False

class Parser(argparse.ArgumentParser):
    def error(self, message):
        sys.stderr.write('error: %s\n' % message)
        self.print_help()
        sys.exit(2)

def get_cmdline_args(sysv_args):
    '''
    Helper function to parse command line arguments
    '''
    global args
    help_str = "Run : " + sysv_args[0] + " -h for help"
    parser = Parser(usage = help_str, \
                formatter_class=argparse.RawTextHelpFormatter)

    help_str_config = "Path to demo config file\n" + \
               "    ex: " + sysv_args[0] + " ../configs/app_config.yaml"
    parser.add_argument("config", help = help_str_config)

    help_str_curses = "Disable curses report\n" + \
                      "default: Disabled"
    parser.add_argument("-n", "--no-curses", help = help_str_curses, \
                                         action = 'store_true', default = False)

    help_str_verbose = "Verbose option to print profile info on stdout\n" + \
                      "default: Disabled"
    parser.add_argument("-v", "--verbose", help = help_str_verbose, \
                                         action = 'store_true', default = False)

    args = parser.parse_args()
    return args

class Report:
    def __init__(self, flow):
        self._proctime = {}
        self._metrics = {}
        self.frame_count = 0
        self.start_time = 0
        self.flow = flow
        report_list.append(self)

    def report_proctime(self, tag, value):
        """
        Used for reporting the processing time values
        All the values with same tag are automatically averaged
        This information is used when printing the ncurses table

        Args:
            tag (string): unique tag to indicate specific processing entity
            value (float): Current measured processing time in microseconds
        """
        try:
            data = self._proctime[tag]
        except KeyError:
            self._proctime[tag] = (0.0, 0)
        finally:
            avg, n = self._proctime[tag]
            avg = (avg * n + value) / (n + 1)
            n = n + 1
            self._proctime[tag] = (avg, n)
            if (print_stdout):
                print("[UTILS] [%s] Time for '%s': %5.2f ms (avg %5.2f ms)" % \
                    (self.flow.model.model_name, tag, value * 1000, avg * 1000))

    def report_frame(self):
        """
        Function to be called at the end of each frame
        used to calculate effective framerate
        """
        if (not self.start_time):
            self.start_time = time()
            return
        self.frame_count += 1
        total_time = time() - self.start_time
        avg_time = total_time * 1000 / self.frame_count
        framerate = self.frame_count / total_time
        self._metrics['total time'] = (avg_time, 'ms', self.frame_count)
        self._metrics['framerate'] = (framerate, 'fps', self.frame_count)
        if (print_stdout):
            print("[UTILS] [%s] Metric '%s': %5.2f %s" % \
               (self.flow.model.model_name, 'total time', \
                self._metrics['total time'][0], self._metrics['total time'][1]))
            print("[UTILS] [%s] Metric '%s': %5.2f %s" % \
               (self.flow.model.model_name, 'framerate', \
                  self._metrics['framerate'][0], self._metrics['framerate'][1]))

def reporting_loop(demo_title):
    """
    Called from a new thread which periodically prints all the processing
    times gathered by call to report_proctime()
    It uses ncurses to print a nice looking table showcasing current value,
    average value and total samples measured, etc
    """
    global report_list
    stdscr = curses.initscr()
    curses.noecho()
    curses.cbreak()
    y, x = stdscr.getmaxyx()
    last_pos = 76
    for report in report_list:
        if len("Model Name: " + report.flow.model.model_name) + 2 > last_pos:
            last_pos = len("Model Name: " + report.flow.model.model_name) + 2;
    stdscr.keypad(True)
    while stop_reporting_loop == False:
        stdscr.clear()
        stdscr.addstr(1, 1, "+%s+" % ('-' * (last_pos - 2)))
        stdscr.addstr(2, 1, "| {:<73s}".format(demo_title))
        stdscr.addstr(2, last_pos, "|")
        stdscr.addstr(3, 1, "+%s+" % ('-' * (last_pos - 2)))
        i = 4
        for report in report_list:
            stdscr.addstr(i, 1, "+%s+" % ('-' * (last_pos - 2)))
            stdscr.addstr(i+1, 1, "| {:<73s}".format("Input Src: " + \
                                                      report.flow.input.source))
            stdscr.addstr(i+1, last_pos, "|")
            stdscr.addstr(i+2, 1, "| {:<73s}".format("Model Name: " + \
                                                  report.flow.model.model_name))
            stdscr.addstr(i+2, last_pos, "|")
            stdscr.addstr(i+3, 1, "| {:<73s}".format("Model Type: " + \
                                                   report.flow.model.task_type))
            stdscr.addstr(i+3, last_pos, "|")
            stdscr.addstr(i+4, 1, "+%s+" % ('-' * (last_pos - 2)))
            i += 5
            for tag in report._proctime.keys():
                (avg, n) = report._proctime[tag]
                avg = avg * 1000
                stdscr.addstr(i, 1, "| {:<32s} :".format(tag))
                stdscr.addstr(i, 42, "{:>8.2f} ms".format(avg), curses.A_BOLD)
                stdscr.addstr(i, 55, " from {:^5d}  samples ".format(n))
                stdscr.addstr(i, last_pos, "|")
                i = i + 1
            #Throughput
            for tag in report._metrics.keys():
                (val, unit, n) = report._metrics[tag]
                stdscr.addstr(i, 1, "| {:<32s} :".format(tag))
                stdscr.addstr(i, 42, "{:>8.2f} {}".format(val,unit), curses.A_BOLD)
                stdscr.addstr(i, 55, " from {:^5d}  samples ".format(n))
                stdscr.addstr(i, last_pos, "|")
                i = i + 1
            stdscr.addstr(i, 1, "+%s+" % ('-' * (last_pos - 2)))
            if (y - i) < 12:
                break

        stdscr.refresh()
        sleep(1)

    # Cleanup before existing
    curses.nocbreak()
    stdscr.keypad(False)
    curses.echo()
    curses.endwin()
    sys.exit(1)

def enable_curses_reports(demo_title):
    """
    By default, all the processing times are reported on stdout with a single
    print statement. Calling this will start a new thread which uses ncurses
    to display a table with processing times measured for all the tags and
    keeps the table updated periodically.
    This is useful for visualizing the performance of the demo.
    """
    global print_stdout
    print_stdout = False
    thread_report = threading.Thread(target = reporting_loop, \
                                                             args=(demo_title,))
    thread_report.start()

def disable_curses_reports():
    global stop_reporting_loop
    stop_reporting_loop = True
