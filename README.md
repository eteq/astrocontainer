# astrocontainer

This is a cookiecutter template to easily create project-based containers for astronomy-related work (with a focus on a Python-based software stack). While of general use, this template focuses particularly on a container layout that promotes replicability via defined software in the container while maintaining flexibility by keeping the project content (e.g. Python scripts, Jupyter notebooks, large data files) on a host directory.

To use this template, you must have [cookiecutter](https://cookiecutter.readthedocs.io/) installed.  Then do:
```
% cookiecutter https://github.com/eteq/astrocontainer.git
```

And follow the prompts. Once this is done, go into the generated directory, update the `requirements.txt` with project-specific requirements, and then follow the instructions in the project directory README.

## Container manager tool choice

When creating your project, this cookiecutter template gives three options for which kind of container tool to use (that is, the `container_executable` option): [Docker](https://www.docker.com/), [Podman](https://podman.io/), or `containerexec_link`.  While the first two are specific tools, the last requires additional explanation: it configures the template so that container operations are run by whatever tool the `containerexec_link` file points to.  The intend use here is for you to set that file to be a link to a specific tool - e.g. run `ln -s /usr/bin/podman containerexec_link` or `ln -s /usr/bin/docker containerexec_link` from the root of the project. This lets you easily switch between tools by just changing the symlink without needing to re-generate the cookiecutter template.
