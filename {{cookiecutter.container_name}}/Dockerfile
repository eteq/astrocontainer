FROM python:3

RUN /bin/sh -c set -ex; apt-get update; apt-get install -y --no-install-recommends sudo; rm -rf /var/lib/apt/lists/*

WORKDIR /containerapp

COPY *requirements.txt ./
RUN pip install --no-cache-dir -r astrocontainer_requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# for jupyter
EXPOSE 8888 

COPY docker_entrypoint.sh /containerapp/
ENTRYPOINT ["/containerapp/docker_entrypoint.sh"]

CMD [ "python" ]