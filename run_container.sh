#!/usr/bin/env sh

docker run -it --rm --privileged \
           -e HOST_UID="$(id -u)" \
           -e HOST_GID="$(id -g)" \
           --mount type=bind,source="$(pwd)"/content,target=/usr/src/app/content \
           -w /usr/src/app/content \
           astrocontainer "$@"