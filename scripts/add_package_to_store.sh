#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <package_name> <version>"
    exit 1
fi

PACKAGE=$1
VERSION=$2

FULL_PATH="store/${PACKAGE,,}/$VERSION/"

mkdir -p $FULL_PATH

cp "packages/$PACKAGE/bin/Debug/$PACKAGE.$VERSION.nupkg" "$FULL_PATH$PACKAGE.$VERSION.nupkg"
