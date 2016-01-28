FROM holywen/commanderbase

MAINTAINER Shaohua Wen
COPY ./ /tmp
RUN chmod +x /tmp/ElectricFlow-*
 
RUN addgroup ubuntu
RUN useradd -m -g ubuntu ubuntu
RUN /tmp/ElectricFlow-* --mode silent --installAgent --unixAgentUser ubuntu --unixAgentGroup ubuntu
 
EXPOSE 7800
CMD /etc/init.d/commanderAgent start && tail -F /opt/electriccloud/electriccommander/logs/commander.log

