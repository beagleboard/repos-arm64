#!/usr/bin/python3
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

'''
A class is defined for each Run Time supported by TIDL
constructor of the classes will load the model and returns
the object, returned object can be called with inputs to
get the inference
currently supported Run Times
1. tvmdlr
2. tflitert
3. onnxrt
'''

import tflite_runtime.interpreter as tflitert_interpreter
from dlr import DLRModel
import onnxruntime
import numpy as np
import threading

class tvmdlr:
    '''
    Abstracts the tvmdlr Run Time
    '''
    def __init__(self, params):
        self.params = params
        self.model = DLRModel(params.artifacts, 'cpu')
        self.input_names = self.model.get_input_names()
        self._lock = threading.Lock()
        self.data_type = np.dtype(self.model.get_input_dtype(0))

    def __call__(self, input_img):
        with self._lock:
            return self.model.run({self.input_names[0] : input_img})

class tflitert:
    '''
    Abstracts the tflitert Run Time
    '''
    def __init__(self, params):
        self.params = params
        delegate_options = {
            "tidl_tools_path": "null",
            "artifacts_folder": params.artifacts,
            "import": 'no',
        }
        tidl_delegate = [tflitert_interpreter.load_delegate\
                         ('/usr/lib/libtidl_tfl_delegate.so', delegate_options)]
        self.interpreter = tflitert_interpreter.Interpreter(params.model_path,\
                                           experimental_delegates=tidl_delegate)
        self.interpreter.allocate_tensors()
        self.input_details = self.interpreter.get_input_details()
        self.output_details = self.interpreter.get_output_details()
        self._lock = threading.Lock()
        self.data_type = self.input_details[0]['dtype']

    def __call__(self, input_img):
        with self._lock:
            self.interpreter.set_tensor(self.input_details[0]['index'], input_img)
            self.interpreter.invoke()
            results = [self.interpreter.get_tensor(output_detail['index']) \
                                           for output_detail in self.output_details]
            return results

class onnxrt:
    '''
    Abstracts the onnxrt Run Time
    '''
    def __init__(self, params):
        self.params = params
        runtime_options = {
            "tidl_platform": "J7",
            "tidl_version": "7.2",
            "tidl_tools_path": "null",
            "artifacts_folder": params.artifacts,
            "tensor_bits": 8,
            "import": 'no',
        }
        sess_options = onnxruntime.SessionOptions()
        ep_list = ['TIDLExecutionProvider','CPUExecutionProvider']
        self.interpreter = onnxruntime.InferenceSession(params.model_path,\
                      providers=ep_list, provider_options=[runtime_options, {}],
                                                     sess_options=sess_options)
        input_details = self.interpreter.get_inputs()
        self.input_name = input_details[0].name
        self.data_type = np.dtype(input_details[0].type[7:-1])
        # default float in numpy is 64bit, in onnxruntime its 32 and no float64
        if (self.data_type == np.float64):
            self.data_type = np.float32
        self._lock = threading.Lock()

    def __call__(self, input_img):
        with self._lock:
            return self.interpreter.run(None, {self.input_name:input_img})
