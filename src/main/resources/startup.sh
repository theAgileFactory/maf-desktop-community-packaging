#!/bin/sh

echo 'Running startup.sh'

rm -rf ./nohup.out

nohup ../server/${play.app.artifactId}-${play.app.distSuffix}/bin/${play.app.artifactId} -Dcom.agifac.appid=dev -Dconfig.file=../conf/application.conf -Dlogger.file=../../conf/application-logger.xml -Dhttp.port=${com.agifac.maf.packaging.maf-desktop-community.port} &

echo 'Waiting for the application to be up'
COUNTER_CURRENT=0
COUNTER_MAX_LOOP=15
SLEEP_TIME=2

Parser=`grep "Application started" ./nohup.out`

while [ ! -n "$Parser" -a "$COUNTER_CURRENT" -lt "$COUNTER_MAX_LOOP" ]
do sleep $SLEEP_TIME ;
echo -n "."
let "COUNTER_CURRENT=$COUNTER_CURRENT+1"
Parser=`grep "Application started" ./nohup.out`
done

if [ ! "$COUNTER_CURRENT" -lt "$COUNTER_MAX_LOOP" ]; then
        echo "Application takes to long to start !!!"
else echo $Parser;
fi
