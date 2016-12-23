FROM holywen/commanderbase

MAINTAINER Shaohua Wen
 
RUN addgroup ubuntu
RUN useradd -m -g ubuntu ubuntu
RUN /tmp/ElectricFlow-* --mode silent --installAgent --unixAgentUser ubuntu --unixAgentGroup ubuntu  --remoteServer haproxy

RUN rm -f /tmp/ElectricFlow-*
 
EXPOSE 7800
CMD /etc/init.d/commanderAgent console

