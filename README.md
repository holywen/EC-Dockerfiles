# EC-Dockerfiles
##DESCRIPTION:
This is example on how to create and run Electric Flow Server cluster with a  Docker Compose.

##USAGE:

###Build and run a 3 flow server nodes EFlow Cluster with Docker Compose:

Step 1: copy license.xml to conf folder

Step 2: Run:

```
  docker-compose up -d
  docker-compose logs -f
```
You'll run the latest version of Flow server

Step 3: open http://_your.docker.machine.ip_:1936/haproxy?stats

Step 4: when you see commander backend is up and running (green in haproxy page), 
```
  docker ps
  docker exec -it <any of commanderserver container id> bash
  /tmp/import_license_and_create_resource.sh
```

Step 5: open https://_your.docker.machine.ip_ and login with admin/changeme

###Try other versions
If you want to run a specific version of Flow server version, try:
```
  TAG=7.0.0 docker-compose up -d
```

Available versions include: 7.0.0, latest

###Clean up everything
```
  ./clean.sh
```

##AUTHOR:
Shaohua Wen, Electric Cloud Professional Service Engineer swen@electric-cloud.com, with original dockerfile example from Nikhil Vaze <nvaze@electric-cloud.com>


##DISCLAIMER:
This module is not officially supported by Electric Cloud.
