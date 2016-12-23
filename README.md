# EC-Dockerfiles
##DESCRIPTION:
This is example docker files on how to put Electric Flow Server and Electric Flow Agent into a docker container.

##USAGE:

###Build a Docker Composer to start an Electric Flow Server and a Electric Flow Agent together:

Step 1: copy ElectricFlow installer to commanderBase folder

Step 2: copy ElectricFlow license.xml to conf folder

Step 3: Run:

```
  docker-composer up
```

Step 4: open http://<you docker machine ip>:1936/haproxy?stats

Step 5: when you see commander backend is up and running (green in haproxy page), 
```
  docker ps
  docker exec -it <any of commanderserver container id> bash
  /tmp/import_license_and_create_resource.sh
```

Step 6: open https://<you docker machine ip> and login with admin/changeme

###Build a ElectricFlow Server image
You'll need to first copy latest ElectricFlow installer into the commanderServer folder, then:
```
  cd commanderServer
  ./build.sh
```
###Run it:
```
  cd commanderServer
  /run.sh
```

###Build a ElectricFlow Agent image
You'll need to first copy latest ElectricFlow installer into the commanderServer folder, then:
```
  cd commanderAgent
  ./build.sh
```
###Run it:
```
  cd commanderAgent
  ./run.sh
```

##AUTHOR:
Shaohua Wen, Electric Cloud Professional Service Engineer swen@electric-cloud.com, with original dockerfile example from Nikhil Vaze <nvaze@electric-cloud.com>


##DISCLAIMER:
This module is not officially supported by Electric Cloud.
