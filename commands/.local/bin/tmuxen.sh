#!/bin/bash

cmd=$(which tmux)      # tmux path
session=$(hostname -s) # session name

$cmd has -t $session 2> /dev/null
if [ $? != 0 ]; then
    $cmd new -d -n zsh -s $session "zsh"
    $cmd splitw -h -p 50 -t $session "zsh"
    $cmd selectw -t $session:2
fi

$cmd att -t $session
