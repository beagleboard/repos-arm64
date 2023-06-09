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

import config_parser
import gst_wrapper
from infer_pipe import InferPipe
import utils
import sys

class EdgeAIDemo:
    """
    Abstract the functionality required for the Edge AI demo.
    Creates Input, Model, Output and Flow objects. Sets up infer pipes
    for each flow and starts the infer pipes
    """
    def __init__(self, config):
        """
        Constructor of EdgeAIDemo class
        Args:
            config: Dictionary of params pased from config file
        """
        self.config = config
        self.models = {}
        self.inputs = {}
        self.outputs = {}
        self.flows = []
        self.infer_pipes = []
        self.title = config['title']
        for f in config['flows']:
            flow = config['flows'][f]

            input = flow['input']
            if input in self.inputs:
                print("[ERROR] Same input can not be used for multiple flows")
                sys.exit()
            input_config = config['inputs'][input]
            input_obj = config_parser.Input(input_config)
            self.inputs[input] = input_obj

            models = flow['models']
            model_objs = []
            for m in models:
                if m in self.models:
                    model_objs.append(self.models[m])
                else:
                    model_config = config['models'][m]
                    model_obj = config_parser.Model(model_config)
                    self.models[m] = model_obj
                    model_objs.append(model_obj)

            outputs = flow['outputs']
            output_objs = []
            for o in outputs:
                if o in self.outputs:
                    output_objs.append(self.outputs[o])
                else:
                    output_config = config['outputs'][o]
                    output_obj = config_parser.Output(output_config, self.title)
                    self.outputs[o] = output_obj
                    output_objs.append(output_obj)

            self.flows.append(config_parser.Flow(flow, input_obj, model_objs, \
                                                                   output_objs))

        self.src_strs, self.sink_str = gst_wrapper.get_gst_str(self.flows, \
                                                                  self.outputs)
        self.gst_pipe = gst_wrapper.GstPipe(self.src_strs, self.sink_str)

        for o in self.outputs.values():
            o.gst_pipe = self.gst_pipe

        for f in self.flows:
            for s in f.sub_flows:
                self.infer_pipes.append(InferPipe(s, self.gst_pipe))

    def start(self):
        """
        Member function to start the demo
        """
        for o in self.outputs.values():
            o.bg_pipe.push_frame(o.title_frame,o.gst_bkgnd_sink)
            o.bg_pipe.free()
        self.gst_pipe.start()
        for i in self.infer_pipes:
            i.start()

    def stop(self):
        """
        Member function to stop the demo
        """
        # Issue stop commands to the inference pipes
        for i in self.infer_pipes:
            i.stop()

        # Wait for the inference pipes to exit
        self.wait_for_exit()

    def wait_for_exit(self):
        """
        Wait for the end of demo and do the clean up
        to be called at the end of the main thread
        """
        for i in self.infer_pipes:
            i.wait_for_exit()
        self.gst_pipe.free()
