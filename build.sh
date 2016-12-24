#!/bin/bash
#set -x
if [ "${EFLOW_INSTALLER}" == "" ];then
    echo "Please set the EFLOW_INSTALLER environment variable before build."
    exit 1
fi

folders=( "commanderAgent" "commanderApache" "commanderRepository" "commanderServer" )

for folder in "${folders[@]}"
do
    pushd  $folder
    ./build.sh
    popd
done

