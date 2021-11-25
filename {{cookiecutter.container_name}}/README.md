# {{cookiecutter.container_name}}

REPLACE THIS WITH THE CONTAINER'S PROJECT DESCRIPTION.


To use this container:

1. update `requirements.txt` with known needed requirements
2. Run `./build_container.sh`
n. `./run_container*.sh` and work inside the container's home directory, which maps to the host's `{{cookiecutter.content_dir}}` directory. Run the previous steps whenever the requirements change.

If you are using jupyterlab and want to adjust its configuration you can put changes in the `{{cookiecutter.content_dir}}/.jupyter_config/user-settings` directory.
