FROM holywen/commanderbase
MAINTAINER Shaohua Wen

ARG EFLOW_INSTALLER

#we have to use a fixed hostname when building the docker image but this is not possible see: http://stackoverflow.com/questions/28898787/how-to-handle-specific-hostname-like-h-option-in-dockerfile
#so we use the script to update the server name settings in command server
RUN addgroup ubuntu
RUN useradd -m -g ubuntu ubuntu

RUN wget http://flow:8000/${EFLOW_INSTALLER} -O /tmp/ElectricFlowInstaller && \
    chmod +x /tmp/ElectricFlowInstaller && \
    /tmp/ElectricFlowInstaller --mode silent --installRepository --installAgent --unixServerUser ubuntu --unixServerGroup ubuntu --unixAgentUser ubuntu --unixAgentGroup ubuntu --remoteServer haproxy && \
    rm -f /tmp/ElectricFlowInstaller

EXPOSE 8200

CMD /etc/init.d/commanderRepository start && /etc/init.d/commanderAgent console
