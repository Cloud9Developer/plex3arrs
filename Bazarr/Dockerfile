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

#pre-req

RUN apt-get install python3-pip python3-distutils wget -y && \
	wget https://github.com/morpheus65535/bazarr/releases/latest/download/bazarr.zip && \
	unzip bazarr.zip -d bazarr && \
	python3 -m pip install -r bazarr/requirements.txt && \
	mv bazarr /opt/

#Radarr Install


EXPOSE 6767

#RUN mono /opt/NzbDrone/NzbDrone.exe
#CMD ["/usr/bin/mono /opt/NzbDrone/NzbDrone.exe"]
CMD ["python3", "/opt/bazarr/bazarr.py"]

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
