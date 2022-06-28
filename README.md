# plex3arrs

Sonarr, Radarr, and Bazarr docker containers


## Pre-Reqs

Install docker on your given OS

Build docker containers ( `docker build -t NAME .` ), following these naming conventions:

	- Bazarr: bazarr
	- Sonarr: sonarr
	- Radarr: radarr
	- All 3 "Arrs": three-arrs

*NOTE*: You don't HAVE to use the names listed above but it the cmd.txt files do use these as examples, so replace as desired.

## Usage

**NOTE:** I developed and tested this in linux (Ubuntu 20.04). This *should* work on any OS that can run Docker, but the file paths/structure for local locations MAY be different.

Depending on the docker container you want to build/run, there is a cmd.txt file in each with the command needed to run the application/docker container. 

There are some changes to the command that will need to be made to run successfully, and I'll use 'Arr' as an example since it runs all 3 \*arrs at once:

`docker run -p 8989:8989 -p 7878:7878 -p 6767:6767 -v /PATH/TO/MEDIA:/mnt/media -v /PATH/FOR/SONARR/CONFIG/FILES:/root/.config/Sonarr -v /PATH/FOR/RADARR/CONFIG/FILES:/root/.config/Radarr -v /PATH/FOR/BAZARR/CONFIG/FILES:/opt/bazarr/data -d three-arrs`

- `/PATH/TO/MEDIA`
  - Needs to be changed to the path pointing to your local media location
- `/PATH/FOR/SONARR/CONFIG/FILES`
  - Needs to be changed to the path pointing to your local folder that will hold SONARR configuration/data when the docker container is stopped/PC is restarted
- `/PATH/FOR/RADARR/CONFIG/FILES`
  - Needs to be changed to the path pointing to your local folder that will hold RADARR configuration/data when the docker container is stopped/PC is restarted
- `/PATH/FOR/BAZARR/CONFIG/FILES`
  - Needs to be changed to the path pointing to your local folder that will hold BAZARR configuration/data when the docker container is stopped/PC is restarted

The way I have the above files setup is pointing to files like so (with my username replacing *\<MYUSER\>*):

- /home/\<MYUSER\>/.config/Sonarr
- /home/\<MYUSER\>/.config/Radarr
- /home/\<MYUSER\>/.config/Bazarr
	
