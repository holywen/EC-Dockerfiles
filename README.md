# EC-Dockerfiles
##DESCRIPTION:
This is example docker files on how to put Electric Flow Server and Electric Flow Agent into a docker container.

##USAGE:
###Build a ElectricFlow Server image
You'll need to first copy latest ElectricFlow installer into the flowServer folder, then:
```
  cd flowServer
  ./build.sh
```
###Run it:
```
  cd flowServer
  /run.sh
```

###Build a ElectricFlow Agent image
You'll need to first copy latest ElectricFlow installer into the flowServer folder, then:
```
  cd flowAgent
  ./build.sh
```
###Run it:
```
  cd flowAgent
  ./run.sh
```

##AUTHOR:
Shaohua Wen, Electric Cloud Professional Service Engineer swen@electric-cloud.com, with original dockerfile example from Nikhil Vaze <nvaze@electric-cloud.com>


##DISCLAIMER:
This module is not officially supported by Electric Cloud.
