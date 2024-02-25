#!/bin/bash

# build.sh

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]; then
  echo -e "Missing arguments: [apk|appbundle|ios] [release|debug|profile] [dev|staging|prod]"
  # invalid arguments
  exit 128
fi

DART_DEFINES=$(scripts/generate_dart_defines.sh $4)

if [ $? -ne 0 ]; then
  echo -e "Failed to generate dart defines"
  exit 1
fi

PATH_TO_FLUTTER_GIT_DIRECTORY=$(whereis flutter)
echo -e "$PATH_TO_FLUTTER_GIT_DIRECTORY"

export PATH=[PATH_TO_FLUTTER_GIT_DIRECTORY]/flutter/bin:$PATH
echo -e "artifact: $1, type: $2, flavor: $4\n"
echo -e "DART_DEFINES: $DART_DEFINES\n"
echo -e "prefix: $6"

# eval "flutter build $1 $DART_DEFINES"
echo "$6 flutter build $1 --flavor $2 $3 $DART_DEFINES $5"
eval "$6 flutter build $1 --flavor $2 $3 $DART_DEFINES $5"