# EC-Dockerfiles
##DESCRIPTION:
This is example docker files on how to put Electric Flow Server and Electric Flow Agent into a docker container.

##USAGE:

###Build a Docker Composer to start an Electric Flow Server and a Electric Flow Agent together:
```
  docker-composer up
```

you'll need to add the agent resource to the Flow Server using hostname "agent1".

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
