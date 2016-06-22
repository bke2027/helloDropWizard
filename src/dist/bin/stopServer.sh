#!/bin/bash
cd "$(dirname "$0")"

PROC_FILE="procid"

if [ -e $PROC_FILE ]; 
then
  value=$(cat procid)
  rm $PROC_FILE
  kill $value
  echo "stopped pid $value"
fi
