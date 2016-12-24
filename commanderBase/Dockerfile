FROM ubuntu:12.04.5
MAINTAINER Shaohua Wen

RUN sed -i 's/archive/cn.archive/g' /etc/apt/sources.list

#we put all these command lines in the same line to reduce the image size
RUN apt-get update && \
    apt-get install -y --no-install-recommends ia32-libs net-tools iputils-ping wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

 
