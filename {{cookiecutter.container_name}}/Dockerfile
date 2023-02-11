FROM python:3

RUN /bin/sh -c set -ex; apt-get update; apt-get install -y --no-install-recommends sudo; rm -rf /var/lib/apt/lists/*

WORKDIR /containerapp

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
