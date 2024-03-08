FROM linuxserver/openssh-server:latest
LABEL org.opencontainers.image.source = "https://github.com/UntitleCMS/Python-Sandbox"

ENV PUBLIC_KEY_FILE=/config/authorized_keys
ENV PUID=1000
ENV PGID=1000
ENV TZ=Etc/UTC
ENV SUDO_ACCESS=true
ENV USER_NAME=runner

ENV LIMIT_CPU=10
ENV LIMIT_MEMORY=1000000

RUN mkdir /sourcecode

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 cpulimit && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools


RUN echo "cd /sourcecode" >> /config/.profile
COPY ./scripts/run /config/run
RUN chmod 777 /config/run
