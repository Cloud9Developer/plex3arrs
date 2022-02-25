FROM ubuntu:20.04

USER root

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install \
	git \
	ffmpeg \
	libopus-dev \
	libffi-dev \
	libsodium-dev \
	python3-pip \
	software-properties-common -y && \
	add-apt-repository ppa:deadsnakes/ppa && \
	apt-get update && \
	apt-get install \
	python3.7 \
	build-essential \
	unzip -y && \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get update && \
	apt-get install vim -y

#Mono-devel install (pre-req)

WORKDIR /root

RUN apt-get install gnupg ca-certificates -y && \
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
	echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
	apt-get update && \
	apt-get install mono-devel -y

#Sonarr install

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xA236C58F409091A18ACA53CBEBFF6B99D9B78493 && \
	echo "deb http://apt.sonarr.tv/ master main" | tee /etc/apt/sources.list.d/sonarr.list && \
	apt-get update && \
	apt-get install nzbdrone -y

#Radarr Install

RUN apt-get install curl mediainfo  -y && \
	curl -L -O https://github.com/Radarr/Radarr/releases/download/v3.2.2.5080/Radarr.master.3.2.2.5080.linux.tar.gz && \
	tar -xvzf Radarr.*.linux.tar.gz && \
	mv Radarr /opt

#Bazarr Install

RUN apt-get install python3-pip python3-distutils wget -y && \
	wget https://github.com/morpheus65535/bazarr/releases/latest/download/bazarr.zip && \
	unzip bazarr.zip -d bazarr && \
	python3 -m pip install -r bazarr/requirements.txt && \
	mv bazarr /opt/

COPY . /root/

RUN chmod +x *.sh

EXPOSE 8989 7878 6767

CMD ["/root/start_arr.sh"]

