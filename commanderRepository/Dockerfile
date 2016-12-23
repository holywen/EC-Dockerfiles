FROM holywen/commanderbase
MAINTAINER Shaohua Wen

RUN addgroup ubuntu
RUN useradd -m -g ubuntu ubuntu
RUN /tmp/ElectricFlow-* --mode silent --installRepository --installAgent --unixServerUser ubuntu --unixServerGroup ubuntu --unixAgentUser ubuntu --unixAgentGroup ubuntu --remoteServer haproxy
RUN rm -f /tmp/ElectricFlow-*

EXPOSE 8200

CMD /etc/init.d/commanderRepository start && /etc/init.d/commanderAgent console
