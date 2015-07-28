#!/bin/sh

echo 'Running shutdown.sh'

ps -ef | grep "com.agifac.appid=dev " | grep -v grep | awk '{print $2}' | xargs kill

PIDFILE="../server/maf-desktop-app-dist/RUNNING_PID"
if [ -e "$PIDFILE" ]
then
	rm -rf $PIDFILE
fi


echo 'Done shutdown.sh'
