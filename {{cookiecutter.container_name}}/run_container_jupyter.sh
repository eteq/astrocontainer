#!/usr/bin/env sh

{{container_executable}} run -it --rm --privileged \
           -e HOST_UID="$(id -u)" \
           -e HOST_GID="$(id -g)" \
           --mount type=bind,source="$(pwd)"/{{cookiecutter.content_dir}},target=/containerapp/{{cookiecutter.content_dir}} \
           -p 8888:8888 \
           {{cookiecutter.container_name}} \
           jupyter lab  --ip="0.0.0.0" --notebook-dir="{{cookiecutter.content_dir}}" --LabApp.user_settings_dir="{{cookiecutter.content_dir}}/.jupyter_config/user-settings" --LabApp.workspaces_dir="{{cookiecutter.content_dir}}/.jupyter_config/workspaces"
