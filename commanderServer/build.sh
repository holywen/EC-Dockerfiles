#!/usr/bin/env bash

if [ "${EFLOW_INSTALLER}" == "" ];then
    echo "Please set the EFLOW_INSTALLER environment variable before build."
    exit 1
fi

docker build -t holywen/commanderserver --build-arg EFLOW_INSTALLER .
