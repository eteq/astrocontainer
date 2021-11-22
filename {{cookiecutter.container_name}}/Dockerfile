FROM python:3

RUN /bin/sh -c set -ex; apt-get update; apt-get install -y --no-install-recommends sudo; rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY *requirements.txt ./
RUN pip install --no-cache-dir -r astrocontainer_requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# for jupyter
EXPOSE 8888 

COPY docker_entrypoint.sh /usr/src/app/
ENTRYPOINT ["/usr/src/app/docker_entrypoint.sh"]

CMD [ "python" ]