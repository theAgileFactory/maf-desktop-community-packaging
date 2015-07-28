#!/bin/sh

echo 'Running install.sh'

./cleanup.sh

echo 'Creating server deployment'
(cd .. && mkdir -p server)

echo 'Extracting application server'
(cd ../server && unzip ../play-apps/${play.app.artifactId}-${play.app.distSuffix}.zip && chmod +x ../server/${play.app.artifactId}-${play.app.distSuffix}/bin/${play.app.artifactId})

echo 'Starting server'

./startup.sh >output.log 2>error.log

echo 'Done install.sh'
