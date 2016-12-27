# EC-Dockerfiles
##DESCRIPTION:
This is example on how to create and run Electric Flow Server cluster with Docker Compose.

##USAGE:

###Run a 3 nodes Electric Flow Server Cluster with Docker Compose:

Step 1: copy license.xml to conf folder

Step 2: Run:

```
  export TAG=latest
  docker-compose up -d
  docker-compose logs -f
```
You'll run the latest version of Flow Server

Step 3: open http://your.docker.machine.ip:1936/haproxy?stats

Step 4: when you see commander backend is up and running (when the commander servers turns green in haproxy page), 
```
  docker ps
  docker exec -it <any of commanderserver container id> bash
  /tmp/import_license_and_create_resource.sh
```

Step 5: open https://your.docker.machine.ip and login with admin/changeme

### Shutdown the cluster
```
  docker-compose down
```

####Try other versions
If you want to run a specific version of Flow server version, try:
```
  TAG=7.0.0 docker-compose up -d
```
or
```
  export TAG=7.0.0
  docker-compose up -d
```
Available versions include: 6.0.0, 6.0.6, 7.0.0, 7.0.1, latest

####Clean up the data which generated when runs the cluster
```
  make cleandata
```

###Build your own cluster images
Since docker 1.12 doesn't support map local volumes when build, and  due to security reason, docker doesn't allow connection from within the container to the host machine either.

Because the size of Flow server installer is quite big, COPY it to the container and run the installation will add new layers, which increase the size of the image and cause long download time, the workaround is download it from network, run and delete it afterwards with in a single command line.

So we need to download it from somewhere, for example we can wget it from ftp.electric-cloud.com with a user/pass and download path provided

```
  EFLOW_INSTALLER=ElectricFlow-7.0.0.111324 \
  EFLOW_INSTALLER_DOWNLOAD_PATH='ftp.electric-cloud.com/ElectricFlow/release_7.0/7.0.0.111324/linux/x86' \
  EFLOW_DOWNLOAD_USER=swen EFLOW_DOWNLOAD_PASS='changeme' \
  TAG=7.0.0 \
  make build
```
or
```
  export EFLOW_INSTALLER=ElectricFlow-7.0.0.111324
  export EFLOW_INSTALLER_DOWNLOAD_PATH='ftp.electric-cloud.com/ElectricFlow/release_7.0/7.0.0.111324/linux/x86'
  export EFLOW_DOWNLOAD_USER=swen
  export EFLOW_DOWNLOAD_PASS='changeme'
  export TAG=7.0.0
  make build
```

This will build several images.
Afterwards you can run cluster with those images as described previously.


##AUTHOR:
Shaohua Wen, Electric Cloud Professional Service Engineer swen@electric-cloud.com, with original dockerfile example from Nikhil Vaze <nvaze@electric-cloud.com>


##DISCLAIMER:
This module is not officially supported by Electric Cloud.
