#!/bin/bash

# TODO: Make sure that release packages are overriding debug packages

mkdir Store

PACKAGES_PATHS=$(find ./Packages -name "*.nupkg")

for PACKAGE_PATH in $PACKAGES_PATHS
do
    PACKAGE_NAME=$(basename -- $PACKAGE_PATH)
    cp -v $PACKAGE_PATH "./Store/$PACKAGE_NAME"
done