FROM holywen/commanderbase
MAINTAINER Shaohua Wen

COPY ./ /tmp

RUN chmod +x /tmp/ElectricFlow-*
RUN chmod +x /tmp/updatecmdsvrhostnameconf.sh

#we have to use a fixed hostname when building the docker image but this is not possible see: http://stackoverflow.com/questions/28898787/how-to-handle-specific-hostname-like-h-option-in-dockerfile
#so we use the script to update the server name settings in command server
RUN addgroup ubuntu
RUN useradd -m -g ubuntu ubuntu
RUN tmp/ElectricFlow-* --mode silent --installWeb --installRepository --installDatabase --installAgent --installServer --unixServerUser ubuntu --unixServerGroup ubuntu --unixAgentUser ubuntu --unixAgentGroup ubuntu
RUN rm -f /tmp/ElectricFlow-*

EXPOSE 8443 443
#we need to make sure the server name here {commanderserver} is the same as the -h {commanderserver} in the run.sh file
CMD /tmp/updatecmdsvrhostnameconf.sh commanderserver && /etc/init.d/commanderServer start && /etc/init.d/commanderAgent start && /etc/init.d/commanderApache start && tail -F /opt/electriccloud/electriccommander/logs/commander.log
