# EC-Dockerfiles
##DESCRIPTION:
This is example on how to create and run Electric Flow Server cluster with a  Docker Compose.

##USAGE:

###Build and run a 3 flow server nodes EFlow Cluster with Docker Compose:

Step 1: copy ElectricFlow installer to commanderBase folder and Run:

```
   cd commanderBase && ./build.sh
```

Step 2: copy ElectricFlow license.xml to conf folder

Step 3: Run:

```
  docker-compose up -d
  docker-compose logs -f
```

Step 4: open http://_your.docker.machine.ip_:1936/haproxy?stats

Step 5: when you see commander backend is up and running (green in haproxy page), 
```
  docker ps
  docker exec -it <any of commanderserver container id> bash
  /tmp/import_license_and_create_resource.sh
```

Step 6: open https://_your.docker.machine.ip_ and login with admin/changeme


##AUTHOR:
Shaohua Wen, Electric Cloud Professional Service Engineer swen@electric-cloud.com, with original dockerfile example from Nikhil Vaze <nvaze@electric-cloud.com>


##DISCLAIMER:
This module is not officially supported by Electric Cloud.
