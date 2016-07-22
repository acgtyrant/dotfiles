PATH="${HOME}/bin:$PATH"
PATH="${HOME}/.local/bin:$PATH"
PATH="/opt/bin:$PATH"
typeset -U PATH
export PATH
PYTHONPATH="${CAFFE_DIR}/python:$PYTHONPATH"
PYTHONPATH="${RP_DIR}/python:$PYTHONPATH"
typeset -U PYTHONPATH
export PYTHONPATH
