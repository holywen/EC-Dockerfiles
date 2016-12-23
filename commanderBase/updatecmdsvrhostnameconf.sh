#!/usr/bin/env bash

echo "update server name to: $1"

sed -i -e 's/COMMANDER_SERVER_NAME=.*/COMMANDER_SERVER_NAME='${1}'/g' /opt/electriccloud/electriccommander/conf/commander.properties
