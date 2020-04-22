#!/bin/bash

cmd=$(which tmux)      # tmux path
session=$(hostname -s) # session name

$cmd has -t $session 2> /dev/null
if [ $? != 0 ]; then
    $cmd new -d -n zsh -s $session "zsh"
fi

$cmd att -t $session
