import gi
gi.require_version('Gst', '1.0')
gi.require_version('GstApp', '1.0')
from gi.repository import Gst, GstApp, GLib
import numpy as np
import os
import sys

Gst.init(None)

class GstPipe:
    """
    Class to handle gstreamer pipeline related things
    Exposes apis to get appsrc, appsink and push, pull frames
    to gst pipeline
    """
    def __init__(self, gst_src_strs, gst_sink_str):
        """
        Create a gst pipeline using gst launch string
        Args:
            gst_src_str: gst launch string for src (input)
            gst_sink_str: gst launch string for sink (putput)
        """
        self.src_pipe = []
        for src_str in gst_src_strs:
            try:
                pipe = Gst.parse_launch(src_str)
            except GLib.Error as err:
                print("[ERROR]", err.message)
                print("[GST STR]", src_str)
                sys.exit(1)
            self.src_pipe.append(pipe)

        try:
            self.sink_pipe = Gst.parse_launch(gst_sink_str)
        except GLib.Error as err:
            print("[ERROR]", err.message)
            print("[GST STR]", gst_sink_str)
            sys.exit(1)

    def start(self):
        """
        Start the gst pipeline
        """
        ret = self.sink_pipe.set_state(Gst.State.PLAYING)
        if ret == Gst.StateChangeReturn.FAILURE:
            bus = self.sink_pipe.get_bus()
            msg = bus.timed_pop_filtered (Gst.CLOCK_TIME_NONE, \
                                                         Gst.MessageType.ERROR)
            err, debug_info = msg.parse_error()
            print("[ERROR]", err.message)
            sys.exit(1)

        for src in self.src_pipe:
            ret = src.set_state(Gst.State.PLAYING)
            if ret == Gst.StateChangeReturn.FAILURE:
                bus = src.get_bus()
                msg = bus.timed_pop_filtered (Gst.CLOCK_TIME_NONE, \
                                                         Gst.MessageType.ERROR)
                err, debug_info = msg.parse_error()
                print("[ERROR]", err.message)
                sys.exit(1)

    def get_src(self, name, flow_id):
        """
        get the gst src element by name
        """
        return self.src_pipe[flow_id].get_by_name(name)

    def get_sink(self, name, width, height, fps):
        """
        get the gst sink element by name
        """
        caps = Gst.caps_from_string("video/x-raw, " + \
                                    "width=%d, " % width + \
                                    "height=%d, " % height + \
                                    "format=RGB, " + \
                                    "framerate=%d/1" % fps)
        sink = self.sink_pipe.get_by_name(name)
        sink.set_caps(caps)
        return sink

    def pull_frame(self, src, loop):
        """
        Pull a frame from gst pipeline
        Args:
            src: gst src element from which the frame is pulled
            loop: If src need to be looped after eos
        """
        sample = src.try_pull_sample(5000000000)
        if (type(sample) != Gst.Sample):
            if (src.is_eos()):
                if (loop):
                    src.seek_simple(Gst.Format.TIME, Gst.SeekFlags.FLUSH, 0)
                    sample = src.try_pull_sample(5000000000)
                else:
                    return None
            else:
                print("[ERROR] Error pulling frame from GST Pipeline")
                return None
        caps = sample.get_caps()

        struct = caps.get_structure(0)
        width = struct.get_value("width")
        height = struct.get_value("height")

        buffer = sample.get_buffer()
        _ , map_info = buffer.map(Gst.MapFlags.READ)
        frame = np.ndarray((height, width, 3), np.uint8, map_info.data)
        buffer.unmap(map_info)

        return frame

    def pull_tensor(self, src, loop, width, height, layout, data_type):
        """
        Pull a frame from gst pipeline
        Args:
            src: gst src element from which the frame is pulled
            loop: If src need to be looped after eos
            width: width of the tensor
            height: height of the tensor
            layout: data layout (NHWC or NCHW)
            data_type: data type of the tensor
        """
        sample = src.try_pull_sample(5000000000)
        if (type(sample) != Gst.Sample):
            if (src.is_eos()):
                if (loop):
                    src.seek_simple(Gst.Format.TIME, Gst.SeekFlags.FLUSH, 0)
                    sample = src.try_pull_sample(5000000000)
                else:
                    return None
            else:
                print("[ERROR] Error pulling tensor from GST Pipeline")
                return None

        buffer = sample.get_buffer()
        _ , map_info = buffer.map(Gst.MapFlags.READ)
        if layout == "NHWC":
            frame = np.ndarray((1, height, width, 3), data_type, map_info.data)
        elif layout == "NCHW":
            frame = np.ndarray((1, 3, height, width), data_type, map_info.data)
        buffer.unmap(map_info)

        return frame

    def push_frame(self, frame, sink):
        """
        Push a frame from gst pipeline
        Args:
            frame: output frame to be pushed
            sink: gst sink element to which the frame is pushed
        """
        buffer = Gst.Buffer.new_wrapped(frame.tobytes())
        sink.push_buffer(buffer)

    def send_eos(self, sink):
        """
        Send EOS singnal to the sink
        Args:
            sink: gst sink element to which EOS is sent
        """
        sink.end_of_stream()

    def free(self):
        """
        Free the gst pipeline
        """
        #wait for EOS in sink pipeline
        bus = self.sink_pipe.get_bus()
        msg = bus.timed_pop_filtered (Gst.CLOCK_TIME_NONE, \
                                    Gst.MessageType.ERROR | Gst.MessageType.EOS)
        if msg:
            if msg.type == Gst.MessageType.ERROR:
                err, debug_info = msg.parse_error()
                print("[ERROR]", err.message)
        self.sink_pipe.set_state(Gst.State.NULL)
        for src in self.src_pipe:
            src.set_state(Gst.State.NULL)

def get_input_str(input):
    """
    Construct the gst input string
    Args:
        input: input configuration
    """
    image_fmt = {'.jpg':'jpeg', '.png':'png'}
    image_dec = {'.jpg':' ! jpegdec ' , '.png':' ! pngdec '}
    video_ext = {'.mp4':' ! qtdemux', \
                 '.mov':' ! qtdemux', \
                 '.avi':' ! avidemux'}
    video_dec = {'h264':' ! h264parse ! v4l2h264dec' + \
                        ' ! video/x-raw, format=NV12 ', \
                 'h264_sw':' ! h264parse ! avdec_h264 ' + \
                        ' ! tiovxdlcolorconvert ' + \
                        ' ! video/x-raw, format=NV12 ', \
                 'h265':' ! h265parse ! v4l2h265dec' + \
                        ' ! video/x-raw, format=NV12 ', \
                 'h265_sw':' ! h265parse ! avdec_h265 ' + \
                        ' ! tiovxdlcolorconvert ' + \
                        ' ! video/x-raw, format=NV12 ', \
                 'auto':' ! decodebin ! tiovxdlcolorconvert' + \
                        ' ! video/x-raw, format=NV12 '}

    source_ext = os.path.splitext(input.source)[1]
    status = 0
    stop_index = -1
    if (input.source.startswith('/dev/video')):
        if (not os.path.exists(input.source)):
            status = 'no file'
        source = 'camera'
    elif (input.source.startswith('http')):
        if (source_ext not in video_ext):
            status = 'fmt err'
        source = 'http'
    elif (input.source.startswith('rtsp')):
        source = 'rtsp'
    elif (os.path.isfile(input.source)):
        if (source_ext in video_ext):
            source = 'video'
        elif (source_ext in image_dec):
            source = 'image'
            stop_index = 0
        else:
            status = 'fmt err'
    elif ('%' in input.source):
        if (not os.path.exists(input.source % input.index)):
            status = 'no file'
            input.source = input.source % input.index
        elif (not (source_ext in image_dec)):
            status = 'fmt err'
        else:
            source = 'image'
    elif (input.source == 'videotestsrc'):
        source = 'videotestsrc'
    else:
        status = 'no file'

    if (status):
        if (status == 'fmt err'):
            print("Invalid Input Format")
            print("Supported Image input formats : ", \
                                                  [i for i in image_dec.keys()])
            print("Supported video input formats : ", \
                                                  [i for i in video_ext.keys()])
        else:
            print("Invalid Input")
            print('"',input.source, '" doesn\'t exist')
        sys.exit(1)

    if (source == 'camera'):
        if input.format == 'jpeg':
            source_cmd = 'v4l2src device=%s io-mode=2 ! ' % input.source
            source_cmd += 'image/jpeg, width=%d, height=%d ! ' % \
                                                     (input.width, input.height)
            source_cmd += 'jpegdec !'
            source_cmd += ' tiovxdlcolorconvert ! video/x-raw, format=NV12 ! '
        elif input.format == 'NV12':
            source_cmd = 'v4l2src device=%s ! ' % input.source
            source_cmd += 'video/x-raw, width=%d, height=%d, format=NV12 !' % \
                                                     (input.width, input.height)
        elif input.format.startswith('rggb'):
            source_cmd = 'v4l2src device=%s ! queue leaky=2 ! ' % input.source
            source_cmd += 'video/x-bayer, width=%d, height=%d, format=%s !' % \
                                       (input.width, input.height, input.format)
            if (input.sen_id == 'imx219'):
                sen_name = 'SENSOR_SONY_IMX219_RPI'
                format_msb = 7
            elif (input.sen_id == 'imx390'):
                sen_name = 'IMX390-UB953_D3'
                format_msb = 11
            #TODO - Take sensor name and subdev as params
            source_cmd += ' tiovxisp sink_0::device=/dev/v4l-subdev%d' % \
                            input.subdev_id + \
                          ' sensor-name=%s' % sen_name + \
                          ' dcc-isp-file=/opt/imaging/%s/dcc_viss.bin'% \
                            input.sen_id + \
                          ' sink_0::dcc-2a-file=/opt/imaging/%s/dcc_2a.bin' % \
                            input.sen_id + \
                          ' format-msb=%d ! video/x-raw, format=NV12 !' % \
                          format_msb
            if input.ldc:
                source_cmd += ' tiovxldc' + \
                              ' dcc-file=/opt/imaging/%s/dcc_ldc.bin' % \
                                input.sen_id + \
                              ' sensor-name=%s !' % sen_name + \
                              ' video/x-raw, format=NV12,' + \
                              ' width=1920, height=1080 !'
                input.width = 1920
                input.height = 1080
        else:
            source_cmd = 'v4l2src device=%s ! ' % input.source
            source_cmd += 'video/x-raw, width=%d, height=%d !' % \
                                                     (input.width, input.height)
            source_cmd += ' tiovxcolorconvert ! video/x-raw, format=NV12 ! '

    elif (source == 'http'):
        if not(input.format in video_dec):
            input.format = "auto"
        source_cmd = 'souphttpsrc location=' + input.source + \
                                 video_ext[source_ext] + video_dec[input.format]
        source_cmd += ' !'

    elif (source == 'rtsp'):
        source_cmd = 'rtspsrc location=' + input.source + \
                     ' latency=0 buffer-mode=auto ! rtph264depay ' + \
                     '! h264parse ! v4l2h264dec ! video/x-raw, format=NV12 !'

    elif (source == 'image'):
        source_cmd = 'multifilesrc location=' + input.source
        source_cmd += ' loop=true' if input.loop else '' + \
                           ' index=%d stop-index=%d' % (input.index, stop_index)
        source_cmd += ' caps=image/' + image_fmt[source_ext] + ',framerate=1/1 '
        source_cmd += image_dec[source_ext]
        source_cmd += ' ! videoscale ! video/x-raw, width=%d, height=%d !' % \
                                                     (input.width, input.height)
        source_cmd += ' tiovxdlcolorconvert ! video/x-raw, format=NV12 ! '

    elif (source == 'video'):
        if not(input.format in video_dec):
            input.format = "auto"
        source_cmd = 'filesrc location=' + input.source + video_ext[source_ext]\
                                                       + video_dec[input.format]
        source_cmd += ' ! '

    elif (source == 'videotestsrc'):
        source_cmd = 'videotestsrc pattern=%s ' % input.pattern
        source_cmd += '! video/x-raw, width=%d, height=%d, format=%s !' % \
                                       (input.width, input.height, input.format)
        if input.format != 'NV12':
            source_cmd += ' tiovxdlcolorconvert ! video/x-raw, format=NV12 ! '

    return source_cmd

def get_input_split_str(input):
    if input.split_count == 1:
        source_cmd = 'tiovxmultiscaler name=split_%d%d \n' % \
                                                   (input.id, input.split_count)
    else:
        source_cmd = 'tee name=tee_split%d \n' % input.id
        for i in range(input.split_count):
            source_cmd += \
                'tee_split%d. ! queue ! tiovxmultiscaler name=split_%d%d\n' % \
                                                       (input.id, input.id, i+1)

    return source_cmd

def get_output_str(output):
    """
    Construct the gst output strings
    Args:
        output: output configuration
    """
    image_enc = {'.jpg':' jpegenc ! '}
    video_enc = {'.mov':' v4l2h264enc bitrate=10000000 ! h264parse ! qtmux ! ', \
                 '.mp4':' v4l2h264enc bitrate=10000000 ! h264parse ! mp4mux ! ', \
                 '.mkv':' v4l2h264enc bitrate=10000000 ! h264parse ! matroskamux ! '}

    sink_ext = os.path.splitext(output.sink)[1]
    status = 0
    if (output.sink == 'kmssink'):
        sink = 'display'
    elif (os.path.isdir(os.path.dirname(output.sink)) or \
                                    not os.path.dirname(output.sink)):
        if (sink_ext in video_enc):
            sink = 'video'
        elif (sink_ext in image_enc):
            sink = 'image'
        else:
            sink = 'others'
    else:
            sink = 'others'

    if (sink == 'display'):
        sink_cmd = ' kmssink sync=false driver-name=tidss'
        if (output.connector):
                sink_cmd += ' connector-id=%d' % output.connector
    elif (sink == 'others'):
        sink_cmd = ' ' + output.sink
    elif (sink == 'image'):
        sink_cmd = image_enc[sink_ext] + \
                                    ' multifilesink location=' + output.sink
    elif (sink == 'video'):
        sink_cmd = video_enc[sink_ext] + ' filesink location=' + output.sink

    if (output.mosaic):
        sink_cmd = '! video/x-raw,format=NV12, width=%d, height=%d ' % (output.width,output.height) + '!' + sink_cmd

        # To be prepended to the sink_cmd after mosaic element properties are added by subflows
        bg_cmd = ''
        bg_cmd += 'appsrc format=GST_FORMAT_TIME block=true ' + \
               'num-buffers=1 name=%s ' % output.gst_bkgnd_sink_name
        bg_cmd += '! tiovxdlcolorconvert '
        bg_cmd += '! video/x-raw,format=NV12, width=%d, height=%d ' % (output.width, output.height)
        bg_cmd += '! filesink location=/tmp/%s' % output.gst_bkgnd_sink_name + ' \n'

        mosaic_cmd = 'tiovxmosaic name=mosaic_%d background=/tmp/%s' % (output.id, output.gst_bkgnd_sink_name) + '\n'
    else:
        bg_cmd = ''
        mosaic_cmd = ''

    return bg_cmd, mosaic_cmd, sink_cmd

def get_pre_proc_str(flow):
    """
    Construct the gst string for pre-process
    Args:
        flow: flow configuration
    """
    cmd = ''
    if (flow.model.task_type == 'classification'):
        resize = flow.model.resize[0]
        cam_dims = (flow.input.width, flow.input.height)
        #tiovxmultiscaler dosen't support odd resolutions
        resize = (((cam_dims[0]*resize//min(cam_dims)) >> 1) << 1, \
                  ((cam_dims[1]*resize//min(cam_dims)) >> 1) << 1)
    else:
        resize = flow.model.resize

    #tiovxmultiscaler dose not support upscaling and downscaling with scaling
    #factor < 1/4, So use "videoscale" insted
    if (float(flow.input.width)/resize[0] > 4 or \
                                        float(flow.input.height)/resize[1] > 4):
        cmd += 'video/x-raw, width=%d, height=%d ! tiovxmultiscaler ! ' % \
                             ((max(flow.input.width//4, resize[0]) >> 1) << 1, \
                              (max(flow.input.height//4, resize[1]) >> 1) << 1)
    elif (flow.input.width/resize[0] < 1 or flow.input.height/resize[1] < 1):
        cmd += 'video/x-raw, width=%d, height=%d ! videoscale ! ' % \
                                       (flow.input.width, flow.input.height)

    cmd += 'video/x-raw, width=%d, height=%d ! ' % tuple(resize)

    if (flow.model.task_type == 'classification'):
        cmd += 'tiovxdlcolorconvert out-pool-size=4 ! video/x-raw, format=RGB ! '
        left = (resize[0] - flow.model.crop[0])//2
        right = resize[0] - flow.model.crop[0] - left
        top = (resize[1] - flow.model.crop[1])//2
        bottom = resize[1] - flow.model.crop[1] - top
        cmd += 'videobox left=%d right=%d top=%d bottom=%d ! ' % \
                                                      (left, right, top, bottom)

    layout = 0 if flow.model.data_layout == "NCHW"  else 1
    tensor_fmt = "bgr" if (flow.model.reverse_channels) else "rgb"

    if   (flow.model.data_type == np.int8):
        data_type = 2
    elif (flow.model.data_type == np.uint8):
        data_type = 3
    elif (flow.model.data_type == np.int16):
        data_type = 4
    elif (flow.model.data_type == np.uint16):
        data_type = 5
    elif (flow.model.data_type == np.int32):
        data_type = 6
    elif (flow.model.data_type == np.uint32):
        data_type = 7
    elif (flow.model.data_type == np.float32):
        data_type = 10
    else:
        print("[ERROR] Unsupported data type for input tensor")
        sys.exit(1)

    cmd += 'tiovxdlpreproc data-type=%d ' % data_type + \
           'target=%d ' % (flow.id % 2) + \
           'channel-order=%d ' % layout

    if (flow.model.mean):
        cmd += 'mean-0=%f mean-1=%f mean-2=%f ' % tuple(flow.model.mean)

    if (flow.model.scale):
        cmd += 'scale-0=%f scale-1=%f scale-2=%f ' % tuple(flow.model.scale)

    cmd += 'tensor-format=%s ' % tensor_fmt + \
           'out-pool-size=4 ! application/x-tensor-tiovx ! '

    cmd = flow.input.get_split_name() + '. ! queue ! ' + cmd + \
            'appsink name=%s max-buffers=2 ' % flow.gst_pre_src_name + \
            ('drop=true \n' if flow.input.drop else '\n')

    return cmd

def get_sensor_str(flow):
    """
    Construct the gst string for sensor input
    Args:
        flow: flow configuration
    """
    cmd = 'video/x-raw, width=%d, height=%d ! ' % (flow.width, flow.height)
    cmd += 'tiovxdlcolorconvert target=1 out-pool-size=4 ! ' + \
           'video/x-raw, format=RGB ! '
    cmd = flow.input.get_split_name() + '. ! queue ! ' + cmd + \
            'appsink name=%s max-buffers=2 ' % flow.gst_sen_src_name + \
            ('drop=true \n' if flow.input.drop else '\n')
    return cmd

def get_post_proc_str(flow):
    """
    Construct the gst string for post-processing
    Args:
        flow: flow configuration
    """
    cmd = 'appsrc format=GST_FORMAT_TIME is-live=true block=true ' + \
          'do-timestamp=true name=%s ' % flow.gst_post_sink_name
    cmd += '! tiovxdlcolorconvert ! video/x-raw,format=NV12, width=%d, height=%d ' % (flow.width, flow.height)

    if (flow.output.mosaic):
        cmd += '! queue ! mosaic_%d.sink_%d' % (flow.output.id,flow.disp_id) + ' \n'
    else:
        cmd += '! '

    return cmd


def get_gst_str(flows, outputs):
    """
    Construct the src and sink string
    Args:
        inputs: List of inputs
        flows: List of flows
        outputs: List of outputs
    """
    src_strs = []
    for f in flows:
        src_str = f.input.gst_str + f.input.gst_split_str
        for s in f.sub_flows:
            src_str += s.gst_pre_proc_str
            src_str += s.gst_sensor_str
        src_strs.append(src_str)

    sink_str = ''
    for o in outputs.values():
        for s in o.subflows:
            sink_str += s.gst_post_proc_str
        sink_str += o.gst_mosaic_str + o.gst_disp_str + ' \n'

    return src_strs, sink_str
