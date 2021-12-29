#!/usr/bin/env sh

{{container_executable}} run -it --rm --privileged \
           -e HOST_UID="$(id -u)" \
           -e HOST_GID="$(id -g)" \
           --mount type=bind,source="$(pwd)"/{{cookiecutter.content_dir}},target=/containerapp/{{cookiecutter.content_dir}} \
           {{cookiecutter.container_name}} "$@"