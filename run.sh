#!/bin/bash

dir="$1"

# check iuf command line argument is empty or not present
if [ "$1" == "" ] || [ $# -gt 1 ]
then
    echo "Because of docker breaking from too many directories"
    echo "Please provide a directory"
    echo "Usage: "
    echo "    bash $0 [DIR]"
    exit 0
elif [ ! -d "$1" ]
then
    echo "$1 not a directory"
    exit 0
fi

docker run \
    -it \
    -e "TERM=xterm-256color" \
    --privileged --cap-add=SYS_PTRACE --security-opt seccomp=unconfined \
    -v "$(pwd)/$1":"/root/$1" \
    ropanther \
    /bin/bash
