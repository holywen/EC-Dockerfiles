#!/usr/bin/env bash
#docker run -d -p 443:443 -p 8443:8443 --add-host='commanderserver:127.0.0.1' commanderserver
docker run -d -p 443:443 -p 8443:8443 -h commanderserver commanderserver
