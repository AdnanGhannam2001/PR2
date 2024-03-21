#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <package_name> <version>"
    exit 1
fi

mono /usr/local/bin/nuget.exe add "./packages/$1/bin/Debug/$1.$2.nupkg" -source ./store