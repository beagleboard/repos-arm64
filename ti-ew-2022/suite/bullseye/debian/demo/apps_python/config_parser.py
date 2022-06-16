from run_times import *
import gst_wrapper
import yaml
from post_process import create_title_frame, overlay_model_name
import os
import utils
import debug
import threading
import sys

class Input:
    """
    Class to parse and store input parameters
    """
    count = 0
    def __init__(self, input_config):
        """
        Constructor of Input class
        Args:
            input_config: Dictionary of input params provided in config file
        """
        self.source = input_config['source']
        self.width = input_config['width']
        self.height = input_config['height']
        self.fps = input_config['framerate']
        if 'index' in input_config:
            self.index = input_config['index']
        else:
            self.index = 0
        if 'format' in input_config:
            self.format = input_config['format']
        else:
            self.format = 'auto'
        if 'drop' in input_config:
            self.drop = input_config['drop']
        else:
            self.drop = True
        if 'pattern' in input_config:
            self.pattern = input_config['pattern']
        else:
            self.pattern = "ball"
        if 'loop' in input_config:
            self.loop = input_config['loop']
        else:
            self.loop = False
        if 'subdev-id' in input_config:
            self.subdev_id = input_config['subdev-id']
        else:
            self.subdev_id = 2
        if 'ldc' in input_config:
            self.ldc = input_config['ldc']
        else:
            self.ldc = False
        if 'sen-id' in input_config:
            self.sen_id = input_config['sen-id']
        else:
            self.sen_id = 'imx219'
        self.id = Input.count
        Input.count += 1
        self.split_count = 0
        self.splits = 0
        self.gst_str = gst_wrapper.get_input_str(self)

    def get_split_name(self):
        self.splits += 1
        self.split_count = int(self.splits/2)
        if self.splits % 2:
            self.split_count += 1
        self.gst_split_str = gst_wrapper.get_input_split_str(self)
        return 'split_%d%d' % (self.id, self.split_count)

class Model:
    """
    Class to parse and store model parameters
    """
    count = 0
    def __init__(self, model_config):
        """
        Constructor of Model class. Prases param.yaml file present in model
        directory and creates corresponding runtime objects
        Args:
            model_config: Dictionary of model params provided in config file
        """
        self.path = model_config['model_path']
        self.model_name = os.path.basename(os.path.dirname(self.path + '/'))
        with open(self.path  + '/param.yaml', 'r') as f:
            params = yaml.safe_load(f)
        #metrics
        self.label_offset = 0
        if 'metric' in params:
            if 'label_offset_pred' in params['metric']:
                self.label_offset = params['metric']['label_offset_pred']
        #preprocess params
        resize = params['preprocess']['resize']
        if (type(resize) == int):
            self.resize = (resize, resize)
        else:
            self.resize = resize[-1::-1]
        crop = params['preprocess']['crop']
        if (type(crop) == int):
            self.crop = (crop, crop)
        else:
            self.crop = crop[-1::-1]
        self.mean = params['session']['input_mean']
        self.scale = params['session']['input_scale']
        self.reverse_channels = params['preprocess']['reverse_channels']
        self.data_layout = params['preprocess']['data_layout']
        #session params
        self.run_time = params['session']['session_name']
        if isinstance(params['session']['model_path'], list):
            self.model_path = self.path + '/' + \
                                      params['session']['model_path'][0]
        else:
            self.model_path = self.path + '/' + params['session']['model_path']
        self.artifacts = self.path + '/' + params['session']['artifacts_folder']
        #postprocess params
        self.formatter = None
        if 'formatter' in params['postprocess']:
            self.formatter = params['postprocess']['formatter']
        self.ignore_index = None
        if 'ignore_index' in params['postprocess']:
            self.ignore_index = params['postprocess']['ignore_index']
        self.normalized_detections = False
        if 'normalized_detections' in params['postprocess']:
            self.normalized_detections = \
                                  params['postprocess']['normalized_detections']
        self.shuffle_indices = None
        if 'shuffle_indices' in params['postprocess']:
            self.shuffle_indices = params['postprocess']['shuffle_indices']
        #dataset
        if 'input_dataset' in params and 'name' in params['input_dataset']:
            self.dataset = params['input_dataset']['name']
        self.task_type = params['task_type']
        #Create Runtime
        RunTime = eval(self.run_time)
        self.run_time = RunTime(self)
        self.data_type = self.run_time.data_type
        #task specific params
        if self.task_type == 'segmentation':
            if 'alpha' in model_config:
                self.alpha = model_config['alpha']
            else:
                self.alpha = 0.4
        if self.task_type == 'detection' or \
                                      self.task_type == 'human_pose_estimation':
            if 'viz_threshold' in model_config:
                self.viz_threshold = model_config['viz_threshold']
            else:
                self.viz_threshold = 0.5
        if self.task_type == 'classification':
            if 'topN' in model_config:
                self.topN = model_config['topN']
            else:
                self.topN = 5

class Output:
    """
    Class to parse and store output parameters
    """
    count = 0
    def __init__(self, output_config, title):
        """
        Constructor of Output class.
        Args:
            output_config: Dictionary of output params provided in config file
            title: Title of the demo to be added in the output
        """
        self.sink = output_config['sink']
        self.width = output_config['width']
        self.height = output_config['height']
        self.fps = 0
        if 'connector' in output_config:
            self.connector = output_config['connector']
        else:
            self.connector = None
        self.mosaic = True
        self.id = Output.count
        self.gst_bkgnd_sink_name = 'background_%d' % self.id
        self.gst_background_str, self.gst_mosaic_str, self.gst_disp_str = \
						gst_wrapper.get_output_str(self)
        self.gst_bkgnd_sink = None
        self.gst_pipe = None
        self.subflows = []
        self.title_frame = create_title_frame(title, self.width, self.height)
        self.bg_pipe = gst_wrapper.GstPipe([], self.gst_background_str)
        self.bg_pipe.start()
        self.gst_bkgnd_sink = self.bg_pipe.get_sink(self.gst_bkgnd_sink_name, \
                                              self.width, self.height, self.fps)
        Output.count += 1

    def get_disp_id(self, subflow, fps):
        """
        Function to be called by flows which are using this output.
        Args:
            x_pos: Horizontal Position of the flow output in final frame
            y_pos: Vertical Position of the flow output in final frame
            width: Width of the flow output
            height: Height of the flow output
            fps: Framerate of the flow input
        """
        if (subflow.x_pos == None or subflow.y_pos == None or not self.mosaic):
            if (len(self.subflows) == 0):
                self.mosaic = False
                self.gst_background_str,self.gst_mosaic_str,self.gst_disp_str = \
                                               gst_wrapper.get_output_str(self)
            else:
                print("[ERROR] Need mosaic to support multiple subflow" + \
                                                           " with same output")
                sys.exit()
        elif (subflow.x_pos + subflow.width > self.width) or \
                                 (subflow.y_pos + subflow.height > self.height):
            print("[ERROR] Mosaic is not with in the background buffer")
            sys.exit()

        disp_id = len(self.subflows)
        self.subflows.append(subflow)
        if (self.mosaic):
            self.gst_mosaic_str = self.gst_mosaic_str + \
                         'sink_%d::startx=%d  ' % (disp_id, subflow.x_pos) + \
                         'sink_%d::starty=%d  ' % (disp_id, subflow.y_pos) + \
                         'sink_%d::width=%d   ' % (disp_id, subflow.width) + \
                         'sink_%d::height=%d  ' % (disp_id, subflow.height) + \
                          '\n'
            self.title_frame = overlay_model_name(self.title_frame, \
                                                  subflow.model.model_name, \
                                                  subflow.x_pos, subflow.y_pos, \
                                                  subflow.width, subflow.height)
        if fps > self.fps:
            self.fps = fps
        return disp_id


class Flow:
    """
    Class to create and manage sub flows
    """
    count = 0
    def __init__(self, flow_config, input, models, outputs):
        """
        Constructor of Flow class.
        Args:
            flow_config: Dictionary of flow params provided in config file
            input: Input object for the flow
            models: list of models in the flow
            outputs: list of outputs (one for each model)
        """
        self.id = Flow.count
        self.sub_flows = []
        self.input = input
        self.debug_config = None

        if 'debug' in flow_config:
            self.debug_config = flow_config['debug']

        if 'mosaic' in flow_config:
            for m, o, pos in zip(models, outputs, flow_config['mosaic'].values()):
                self.sub_flows.append(SubFlow(input, m, o, pos, self))
        else:
            for m, o in zip(models, outputs):
                self.sub_flows.append(SubFlow(input, m, o, None, self))
        Flow.count += 1

class SubFlow:
    """
    Class to construct a sub flow object combining
    input, model and output
    """
    count = 0
    def __init__(self, input, model, output, pos, flow):
        """
        Constructor of SubFlow class.
        Args:
            input: Input object for the flow
            model: Model object for the flow
            output: Output object for the flow
            pos: Position of the flow output in the final frame
        """
        self.input = input
        self.model = model
        self.output = output
        if (pos):
            self.x_pos = pos['pos_x']
            self.y_pos = pos['pos_y']
            self.width = pos['width']
            self.height = pos['height']
        else:
            self.x_pos = None
            self.y_pos = None
            self.width = output.width
            self.height = output.height

        if (self.input.width < self.width or self.input.height < self.height):
            print("[ERROR] Flow output resolution can not be greater than " + \
                                                             "input resolution")
            sys.exit()

        self.disp_id = output.get_disp_id(self, input.fps)
        self.id = SubFlow.count
        self.gst_pre_src_name = 'pre_%d' % self.id
        self.gst_pre_proc_str = gst_wrapper.get_pre_proc_str(self)
        self.gst_sen_src_name = 'sen_%d' % self.id
        self.gst_sensor_str = gst_wrapper.get_sensor_str(self)
        self.gst_post_sink_name = 'post_%d' % self.id
        self.gst_post_proc_str = gst_wrapper.get_post_proc_str(self)
        self.report = utils.Report(self)
        self.flow = flow
        #Debug
        self.debug_config = None
        if flow.debug_config:
            self.debug_config = debug.DebugConfig(self, flow.debug_config)
        SubFlow.count += 1
