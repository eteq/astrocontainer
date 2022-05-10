import os
import sys
from pathlib import Path

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


{% if cookiecutter.initialize_git == "yes" %}
try:
    from git import Repo
except ImportError:
    print("need gitpython to be installed to initialize git repo")
    sys.exit(1)

content_path = os.path.realpath('{{ cookiecutter.content_dir }}')
repo = Repo.init(content_path)
with open(os.path.join(content_path, '.gitignore'), 'w') as f:
    f.write('data\n')
    f.write('.ipynb_checkpoints\n')
    f.write('__pycache__\n')
    f.write('*.pyc\n')
    f.write('*.pyo\n')

repo.index.add('.gitignore')
repo.index.commit('Initial add of .gitignore')
{% endif %}
