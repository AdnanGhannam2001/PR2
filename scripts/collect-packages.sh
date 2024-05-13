#!/bin/bash

# TODO: Make sure that release packages are overriding debug packages

mkdir store

PACKAGES_PATHS=$(find ./packages -name "*.nupkg")

for PACKAGE_PATH in $PACKAGES_PATHS
do
    PACKAGE_NAME=$(basename -- $PACKAGE_PATH)
    cp -v $PACKAGE_PATH "./store/$PACKAGE_NAME"
done