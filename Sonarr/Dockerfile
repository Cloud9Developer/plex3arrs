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

RUN apt-get install gnupg ca-certificates -y && \
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
	echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
	apt-get update && \
	apt-get install mono-devel -y

#Sonarr install

#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xA236C58F409091A18ACA53CBEBFF6B99D9B78493 && \
#	echo "deb http://apt.sonarr.tv/ master main" | tee /etc/apt/sources.list.d/sonarr.list && \
#	apt-get update && \
#	apt-get install nzbdrone -y
RUN	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 2009837CBFFD68F45BC180471F4F90DE2A9B4BF8 && \
	echo "deb https://apt.sonarr.tv/ubuntu focal main" | tee /etc/apt/sources.list.d/sonarr.list && \
	apt-get update && \
	apt-get install sonarr -y

EXPOSE 8989



#RUN mono /opt/NzbDrone/NzbDrone.exe
#CMD ["/usr/bin/mono /opt/NzbDrone/NzbDrone.exe"]
#CMD ["/usr/bin/mono", "/opt/NzbDrone/NzbDrone.exe"]
CMD ["/usr/bin/mono", "/usr/lib/sonarr/bin/Sonarr.exe"]

#RUN useradd --create-home user1
#USER user1

#WORKDIR /home/user1

#RUN git clone https://github.com/Just-Some-Bots/MusicBot.git && \
#	cd ./MusicBot && \
#	chmod +x *.sh && \
#	python3 -m pip install -U pip && \
#	python3 -m pip install -U -r requirements.txt
#
#RUN echo "Update 2"

#COPY ./options.ini /home/user1/MusicBot/config/options.ini
#COPY ./permissions.ini /home/user1/MusicBot/config/permissions.ini

#CMD ["/home/user1/MusicBot/run.sh"]
