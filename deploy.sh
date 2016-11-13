#!/bin/bash
echo "Environment is $PICNIC_ENVIRONMENT:";

GIT_PULL="echo --- Updating git --- ; git pull";
CD_SRC="echo Moving to /home/knut/src/picnic-server; cd /home/knut/src/picnic-server";
KILL="echo --- killing server ---; kill -9 \$(ps aux | grep '.build\/debug\/picnic-server$' | awk '{print \$2}'); echo DONE..";
BUILD="echo --- compiling source code ---; /home/knut/swift/usr/bin/swift build; echo SUCCESS..";
RUN="echo --- Starting server ---; nohup .build\/debug\/picnic-server > \/dev\/null 2>\&1 &";
EXIT="exit"


if [ "$PICNIC_ENVIRONMENT" == "PRODUCTION" ]; then
	echo "in production, doing nothing";

elif [ "$PICNIC_ENVIRONMENT" == "DEVELOP" ]; then
	echo "Detected environment develop!";
	echo "Remoting into server: 178.62.24.176";
	ssh 178.62.24.176 -l knut "$CD_SRC; $GIT_PULL; $BUILD; $KILL; $RUN";
else
	echo "PICNIC_ENVIRONMENT not configured! exiting.."
fi