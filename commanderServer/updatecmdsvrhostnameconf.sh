#!/usr/bin/env bash

echo "update server name to: $1"

sed -i -e 's/COMMANDER_SERVER_NAME=.*/COMMANDER_SERVER_NAME='${1}'/g' /opt/electriccloud/electriccommander/conf/commander.properties
sed -i -e 's/COMMANDER_HOST=.*/COMMANDER_HOST='${1}'/g' /opt/electriccloud/electriccommander/conf/repository/server.properties
sed -i -e 's/SetEnv COMMANDER_SERVER ".*/SetEnv COMMANDER_SERVER "'${1}'"/g' /opt/electriccloud/electriccommander/apache/conf/httpd.conf
