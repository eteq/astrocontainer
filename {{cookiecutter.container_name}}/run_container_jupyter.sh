#!/usr/bin/env sh
{% if cookiecutter.container_executable == "containerexec_link" %}
CONTAINER_EXEC=`dirname $0`/{{cookiecutter.container_executable}}
{% else %}
CONTAINER_EXEC={{cookiecutter.container_executable}}
{% endif %}

EXTERNALPORT=${1:-8888}

echo "You may need to use one of these ip addresses depending on how your container network is set up:"
ifconfig | grep inet
echo "Regardless of what the log below says, the port to connect to is: $EXTERNALPORT\n"
echo "" # blank line to make the above a bit more prominent

$CONTAINER_EXEC run -it --rm --privileged \
           -e HOST_UID="$(id -u)" \
           -e HOST_GID="$(id -g)" \
           --mount type=bind,source="$(pwd)"/{{cookiecutter.content_dir}},target=/containerapp/{{cookiecutter.content_dir}} \
           -p $EXTERNALPORT:8888 \
           {{cookiecutter.container_name}} \
           jupyter lab  --ip="0.0.0.0" --notebook-dir="{{cookiecutter.content_dir}}" --LabApp.user_settings_dir="{{cookiecutter.content_dir}}/.jupyter_config/user-settings" --LabApp.workspaces_dir="{{cookiecutter.content_dir}}/.jupyter_config/workspaces" --allow-root 

if [ $? -eq 126 ]
then
  echo "If the failure above was due to a port not being available, try explicitly requesting a free port like \"./run_container_jupyter 8899\""
fi
