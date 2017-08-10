#!/bin/bash

# Simplify Your Life With an SSH Config File
# http://nerderati.com/2011/03/17/simplify-your-life-with-an-ssh-config-file/

for server in aa yy dd
do
  echo $server
  ssh $server nvidia-smi pmon -c 1
done
