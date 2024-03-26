#!/bin/bash

PROJECT=$1
PACKAGE=$2
VERSION=$3

dotnet add $PROJECT package $PACKAGE --version $VERSION --source "./store/${PACKAGE,,}"
