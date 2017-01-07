FROM holywen/commanderbase
MAINTAINER Shaohua Wen

ARG EFLOW_INSTALLER
ARG EFLOW_INSTALLER_DOWNLOAD_PATH
ARG EFLOW_DOWNLOAD_USER
ARG EFLOW_DOWNLOAD_PASS

RUN addgroup ubuntu
RUN useradd -m -g ubuntu ubuntu

RUN curl ftps://${EFLOW_DOWNLOAD_USER}:${EFLOW_DOWNLOAD_PASS}@${EFLOW_INSTALLER_DOWNLOAD_PATH}/${EFLOW_INSTALLER} -o /tmp/ElectricFlowInstaller && \
    chmod +x /tmp/ElectricFlowInstaller && \
    /tmp/ElectricFlowInstaller --mode silent --installRepository --installAgent --unixServerUser ubuntu --unixServerGroup ubuntu --unixAgentUser ubuntu --unixAgentGroup ubuntu --remoteServer haproxy && \
    rm -f /tmp/ElectricFlowInstaller

EXPOSE 8200

CMD /etc/init.d/commanderRepository start && /etc/init.d/commanderAgent console
