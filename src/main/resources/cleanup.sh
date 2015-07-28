#!/bin/sh

echo 'Running cleanup.sh'

./shutdown.sh

rm -rf ../server
rm -rf ./nohup.out

echo 'Done cleanup.sh'
