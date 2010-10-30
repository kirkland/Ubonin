#!/bin/bash

if [[ -z $1 ]]; then
  echo "usage: $0 <filename.zip>"
  exit 1
fi

if [[ -d temp ]]; then
  rm -rf temp
fi
mkdir temp

unzip "$1" -d temp

dirs=( layout templates config assets )
for dir in ${dirs[@]}; do
  mv temp/www-ubonin-com-main/$dir/* $dir
done
