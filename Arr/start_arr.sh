#!/bin/bash

function checkpid() {

    if [ ! -z `ps aux | awk '{print $2}' | grep -w $1` ]; then
		exit 0
    else
        echo Process $1 not found..
		exit 1
    fi
}

echo Starting Sonarr..
/usr/bin/mono /opt/NzbDrone/NzbDrone.exe &
pid_sonarr=$!
echo $pid_sonarr

echo Starting Radarr..
/usr/bin/mono /opt/Radarr/Radarr.exe &
pid_radarr=$!
echo $pid_radarr

echo Starting Bazarr..
python3 /opt/bazarr/bazarr.py &
pid_bazarr=$!
echo $pid_bazarr

pids="$pid_sonarr $pid_radarr $pid_bazarr"
echo $pids

while true; do
   #checking pids
   for pid in $pids; do
	   result=`checkpid $pid`
	   rc=$?
	   echo $result
	   if [ $rc -ne 0 ]; then
	      exit 1
	   fi
   done
done

exit 1