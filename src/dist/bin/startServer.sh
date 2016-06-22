#!/bin/bash
echo "starting my-project..."
cd "$(dirname "$0")"
if [ -e procid ]; then
  echo "It looks like my-project is already running"
  exit -1
fi
if [ ! -d ../log ]; then
  mkdir ../log
fi
nohup ./my-project server ../config/hello-world.yml > ../log/console.log 2> ../log/error.log &
THE_PID=$!
echo "$THE_PID" > procid
echo "my-project started with PID $THE_PID and running in the background"
tail -f ../log/console.log
