FROM holywen/commanderbase

MAINTAINER Shaohua Wen
 
ARG EFLOW_INSTALLER
ARG EFLOW_INSTALLER_DOWNLOAD_PATH
ARG EFLOW_DOWNLOAD_USER
ARG EFLOW_DOWNLOAD_PASS

RUN addgroup ubuntu
RUN useradd -m -g ubuntu ubuntu

RUN wget ftp://${EFLOW_DOWNLOAD_USER}:${EFLOW_DOWNLOAD_PASS}@${EFLOW_INSTALLER_DOWNLOAD_PATH}/${EFLOW_INSTALLER} -O /tmp/ElectricFlowInstaller && \
    chmod +x /tmp/ElectricFlowInstaller && \
    /tmp/ElectricFlowInstaller --mode silent --installAgent --unixAgentUser ubuntu --unixAgentGroup ubuntu  --remoteServer haproxy && \
    rm -f /tmp/ElectricFlowInstaller

EXPOSE 7800
CMD /etc/init.d/commanderAgent start && tail -F /opt/electriccloud/electriccommander/logs/agent/agent.log

