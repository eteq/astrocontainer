#!/bin/bash

# from https://www.joyfulbikeshedding.com/blog/2021-03-15-docker-and-the-host-filesystem-owner-matching-problem.html

set -e

if [[ -z "$HOST_UID" ]]; then
    echo "ERROR: please set HOST_UID" >&2
    exit 1
fi
if [[ -z "$HOST_GID" ]]; then
    echo "ERROR: please set HOST_GID" >&2
    exit 1
fi

addgroup --gid "$HOST_GID" matchinguser
adduser --uid "$HOST_UID" --gid "$HOST_GID" --gecos "" --disabled-password {{cookiecutter.container_name}}er

cd /home/{{cookiecutter.container_name}}

# Drop privileges and execute next container command, or 'bash' if not specified. 
if [[ $# -gt 0 ]]; then
    if [ $1 = "bashroot" ]; then
        # if first argument is bashroot, go to shell as root
        bash
    else
        exec sudo -u {{cookiecutter.container_name}}er -- "$@"
    fi
else
    exec sudo -u {{cookiecutter.container_name}}er -- bash
fi