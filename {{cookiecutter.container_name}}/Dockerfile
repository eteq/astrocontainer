FROM python:3

RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=type=cache,target=/var/cache/apt \
    /bin/sh -c set -ex; apt-get update; apt-get install -y --no-install-recommends sudo

WORKDIR /containerapp

# make sure we have the latest pip before starting anything else
RUN --mount=type=cache,target=/root/.cache pip install --upgrade pip

COPY astrocontainer_requirements.txt ./
RUN --mount=type=cache,target=/root/.cache pip install -r astrocontainer_requirements.txt
COPY requirements.txt ./
RUN --mount=type=cache,target=/root/.cache pip install -r requirements.txt

#ANY CUSTOM SETUP COMMANDS SHOULD GO HERE:
# RUN ...
#EMD

# for jupyter
EXPOSE 8888 

COPY entrypoint_script.sh /containerapp/
ENTRYPOINT ["/containerapp/entrypoint_script.sh"]

CMD [ "python" ]
