#!/usr/bin/env sh
{% if cookiecutter.container_executable == "containerexec_link" %}
CONTAINER_EXEC=`dirname $0`/{{cookiecutter.container_executable}}
{% else %}
CONTAINER_EXEC={{cookiecutter.container_executable}}
{% endif %}
$CONTAINER_EXEC build -t {{cookiecutter.container_name}}:latest .
