#!/bin/bash
http_proxy= curl -F "name=@$*" http://img.vim-cn.com | cat
