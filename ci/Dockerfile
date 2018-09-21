FROM ubuntu:latest

RUN apt-get update \
 && apt-get install --no-install-recommends -y \
      apt-transport-https \
      ca-certificates \
      curl \
      gpg-agent \
      software-properties-common \
 && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
 && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

RUN apt-get update \
 && apt-get install --no-install-recommends -y \
      docker-ce \
 && rm -rf /var/lib/apt/lists/*
