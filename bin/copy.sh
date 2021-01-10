#!/bin/bash

for file in $CONFIG_PATH/.[^.]*; do
# for file in ../config/.[^.]*; do 
  echo "Copying ${file}"
  cp -f $file ~/ 
done