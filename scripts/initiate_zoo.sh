#!/bin/bash
set -e

export PATH=$PATH:/opt/electriccloud/electriccommander/bin

echo "sleep 10 senconds to wait zookeeper start"
sleep 10

if [ ! -f /opt/electriccloud/electriccommander/conf/zoo_ready ]; then
  cd /opt/electriccloud/electriccommander/conf
  COMMANDER_ZK_CONNECTION=zookeeper1:2181 ../jre/bin/java -jar \
      ../server/bin/zk-config-tool-jar-with-dependencies.jar com.electriccloud.commander.cluster.ZKConfigTool \
      --databasePropertiesFile database.properties \
      --keystoreFile keystore \
      --passkeyFile passkey \
     --commanderPropertiesFile commander.properties
  touch /opt/electriccloud/electriccommander/conf/zoo_ready

fi
