# EC-Dockerfiles
##DESCRIPTION:
This is example on how to create and run Electric Flow Server cluster with Docker Compose.

##USAGE:

###Run a Electric Flow Server Cluster with Docker Compose:

####Gentle reminder: You'll need to first increase your memory of your docker machine to at least 3 GB + n * 3 GB (n=number of commander instances), or you'll have really bad performance due to disk swapping or even not able to start up the cluster.

Step 1: copy license.xml to conf folder

Step 2: Run:

```
  docker-compose up -d
  docker-compose logs -f
  docker-compose scale commanderserver=n #replace n to number of instances you want to run
```
You'll run the latest version of Flow Server

Step 3: open http://your.docker.machine.ip:1936/haproxy?stats

Step 4: when you see commander backend is up and running (when the commander servers turns green in haproxy page), 
```
  docker exec $(docker ps |grep commanderserver_1|awk '{print $1}')   /tmp/scripts/import_license_and_create_resource.sh
```

Step 5: open https://your.docker.machine.ip and login with admin/changeme

### Shutdown the cluster
```
  docker-compose stop
```

####Try other versions
If you want to run a specific version of Flow server version, try:
```
  export TAG=7.0.0
  docker-compose up -d
```
Available versions include: **6.0.0, 6.0.6, 7.0.0, 7.0.1, 7.1.0, latest**

####Clean up the data which generated when runs the cluster
```
  make cleandata 
```
or
```
  make clean
```

### Save images

```TAG=7.1.0 make save```

Then images will be saved to your images folder, so  you don't need to download again later.

### Load images 

```TAG=7.1.0 make load```

This will load your previously saved images to docker

###Build your own cluster images

Put the Electric Flow installer to the EC-Dockerfiles folder and run:

```
  export EFLOW_INSTALLER=ElectricFlow-7.1.0.113861
  export TAG=7.1.0
  make build
```

This will build several images.
Afterwards you can run cluster with those images as described previously.


##AUTHOR:
Shaohua Wen, Electric Cloud Solution Engineer swen@electric-cloud.com, with original dockerfile example from Nikhil Vaze <nvaze@electric-cloud.com>


##DISCLAIMER:
This module is not officially supported by Electric Cloud.
