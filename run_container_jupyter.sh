#!/usr/bin/env sh

docker run -it --rm --privileged \
           -e HOST_UID="$(id -u)" \
           -e HOST_GID="$(id -g)" \
           --mount type=bind,source="$(pwd)"/content,target=/usr/src/app/content \
           -w /usr/src/app/content \
           -p 8888:8888 \
           astrocontainer \
           jupyter lab  --ip="0.0.0.0" --allow-root