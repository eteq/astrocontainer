import os
import sys

REMOVE_PATHS = [
    '{% if cookiecutter.container_executable != "containerexec_link" %} containerexec_link {% endif %}',
]

for path in REMOVE_PATHS:
    path = path.strip()
    if path and os.path.exists(path):
        if os.path.isdir(path):
            os.rmdir(path)
        else:
            os.unlink(path)

{% if cookiecutter.container_executable == "podman" %}
if os.path.exists('Dockerfile'):
    os.rename('Dockerfile', 'Containerfile')
{% endif %}