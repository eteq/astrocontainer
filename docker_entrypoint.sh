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
adduser --uid "$HOST_UID" --gid "$HOST_GID" --gecos "" --disabled-password astrocontainerer

cd /home/astrocontainerer

# Drop privileges and execute next container command, or 'bash' if not specified. 
if [[ $# -gt 0 ]]; then
    if [ $1 = "bashroot" ]; then
        # if first argument is bashroot, go to shell as root
        bash
    else
        exec sudo -u astrocontainerer -- "$@"
    fi
else
    exec sudo -u astrocontainerer -- bash
fi