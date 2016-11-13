#!/bin/bash
echo "Environment is $PICNIC_ENVIRONMENT:";

GIT_PULL="git pull";
CD_SRC="echo cd /home/knut/src/picnic-server; cd /home/knut/src/picnic-server";
KILL="kill $(ps aux | grep '[p]icnic-server' | awk '{print $2}')";
PROFILE="source ~/.bashrc"
BUILD="swift build";
RUN=".build/debug/picnic-server&";


if [ "$PICNIC_ENVIRONMENT" == "PRODUCTION" ]; then
	echo "in production, doing nothing";

elif [ "$PICNIC_ENVIRONMENT" == "DEVELOP" ]; then
	echo "in develop";
	ssh 178.62.24.176 -l knut "$CD_SRC; ./deploy.sh"
else
	echo "PICNIC_ENVIRONMENT not configured! exiting.."
fi