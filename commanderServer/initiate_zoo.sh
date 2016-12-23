#!/bin/bash
set -e

export PATH=$PATH:/opt/electriccloud/electriccommander/bin

if [ ! -f /opt/electriccloud/electriccommander/conf/zoo_ready ]; then

  cd /opt/electriccloud/electriccommander/conf
  COMMANDER_ZK_CONNECTION=zoo1:2181 ../jre/bin/java -jar \
      ../server/bin/zk-config-tool-jar-with-dependencies.jar com.electriccloud.commander.cluster.ZKConfigTool \
      --databasePropertiesFile database.properties \
      --keystoreFile keystore \
      --passkeyFile passkey \
     --commanderPropertiesFile commander.properties
  touch /opt/electriccloud/electriccommander/conf/zoo_ready

fi
