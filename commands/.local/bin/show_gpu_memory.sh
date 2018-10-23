#!/bin/bash

# Simplify Your Life With an SSH Config File
# http://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/

for server in aa yy dd tuba 102 103
do
  echo $server
  timeout 2s ssh $server nvidia-smi --query-gpu=gpu_name,memory.total --format=csv
done
