#!/usr/bin/env sh
{% if cookiecutter.container_executable == "containerexec_link" %}
CONTAINER_EXEC=`dirname $0`/{{cookiecutter.container_executable}}
{% else %}
CONTAINER_EXEC={{cookiecutter.container_executable}}
{% endif %}

echo "You may need to use one of these ip addresses depending on how your container network is set up:"
ifconfig | grep inet

$CONTAINER_EXEC run -it --rm --privileged \
           -e HOST_UID="$(id -u)" \
           -e HOST_GID="$(id -g)" \
           --mount type=bind,source="$(pwd)"/{{cookiecutter.content_dir}},target=/containerapp/{{cookiecutter.content_dir}} \
           -p 8888:8888 \
           {{cookiecutter.container_name}} \
           jupyter lab  --ip="0.0.0.0" --notebook-dir="{{cookiecutter.content_dir}}" --LabApp.user_settings_dir="{{cookiecutter.content_dir}}/.jupyter_config/user-settings" --LabApp.workspaces_dir="{{cookiecutter.content_dir}}/.jupyter_config/workspaces" --allow-root 
