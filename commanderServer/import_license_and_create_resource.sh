#!/bin/bash
set -e

export PATH=$PATH:/opt/electriccloud/electriccommander/bin

ectool login admin changeme

if [ ! -f /opt/electriccloud/electriccommander/conf/license_ready ]; then

  ectool importLicenseData /opt/electriccloud/electriccommander/conf/license.xml 
  touch /opt/electriccloud/electriccommander/conf/license_ready

fi

if [ ! -f /opt/electriccloud/electriccommander/conf/agents_ready ]; then

  ectool createResource local --hostName localagent --pools default
  ectool pingResource local
  ectool createResource apacheAgent --hostName  commanderapache --pools default
  ectool pingResource apacheAgent
  ectool createResource repositoryAgent --hostName  repository --pools default
  ectool pingResource repositoryAgent
 
  touch /opt/electriccloud/electriccommander/conf/agents_ready
  
fi




