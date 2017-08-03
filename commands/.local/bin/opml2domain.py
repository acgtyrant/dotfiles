#!/bin/python3
# encoding: UTF-8

import re, sys

file = open(sys.argv[1], 'r')
new_file = open('handle-' + sys.argv[1], 'w')
pattern = re.compile(r'.*htmlUrl="([^"]+)"/>$')

for line in file.readlines():
    replace = re.sub(pattern, r'\1', line)
    if replace != line:
        new_file.write(replace)
