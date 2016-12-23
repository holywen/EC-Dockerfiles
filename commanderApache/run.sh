#!/usr/bin/env bash
#docker run -d -p 443:443 -p 8443:8443 --add-host='commanderserver:127.0.0.1' commanderserver
sudo ifconfig lo0 alias 10.200.10.11
docker run -d -p 443:443 -h 10.200.10.11  holywen/commanderapache
