#!/usr/bin/env sh
{% if cookiecutter.container_executable == "containerexec_link" %}
CONTAINER_EXEC=`dirname $0`/{{cookiecutter.container_executable}}
{% else %}
CONTAINER_EXEC={{cookiecutter.container_executable}}
{% endif %}
$CONTAINER_EXEC run -it --rm --privileged \
           -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -v $HOME/.Xauthority:$HOME/.Xauthority \
           -e HOST_UID="$(id -u)" \
           -e HOST_GID="$(id -g)" \
           --mount type=bind,source="$(pwd)"/{{cookiecutter.content_dir}},target=/containerapp/{{cookiecutter.content_dir}} \
           {{cookiecutter.container_name}} "$@"
