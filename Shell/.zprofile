PATH="${HOME}/bin:$PATH"
PATH="${HOME}/.local/bin:$PATH"
PATH="/opt/bin:$PATH"
PATH="${CAFFE_DIR}/build/tools:$PATH"
typeset -U PATH
export PATH
PYTHONPATH="${CAFFE_DIR}/python:$PYTHONPATH"
PYTHONPATH="${RP_DIR}/python:$PYTHONPATH"
PYTHONPATH="${HOME}/.local/lib/python2.7/dist-packages:$PYTHONPATH"
PYTHONPATH="${HOME}/.local/lib/python3.4/dist-packages:$PYTHONPATH"
PYTHONPATH="${HOME}/.local/lib/python3.5/dist-packages:$PYTHONPATH"
typeset -U PYTHONPATH
export PYTHONPATH
