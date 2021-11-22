#!/usr/bin/env sh

docker run -it --rm --privileged \
           -e HOST_UID="$(id -u)" \
           -e HOST_GID="$(id -g)" \
           --mount type=bind,source="$(pwd)"/{{cookiecutter.content_dir}},target=/usr/src/app/{{cookiecutter.content_dir}} \
           -w /usr/src/app/{{cookiecutter.content_dir}} \
           -p 8888:8888 \
           {{cookiecutter.container_name}} \
           jupyter lab  --ip="0.0.0.0" --allow-root