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
    /tmp/ElectricFlowInstaller --mode silent --installServer --unixServerUser ubuntu --unixServerGroup ubuntu \
        --unixAgentUser ubuntu --unixAgentGroup ubuntu &&\
    rm -f /tmp/ElectricFlowInstaller

COPY ./mysql-connector-java.jar /opt/electriccloud/electriccommander/server/lib/mysql-connector-java.jar

#ignore the server mismatch and passkey mismatch
RUN echo "set.default.COMMANDER_IGNORE_SERVER_MISMATCH=1" >> /opt/electriccloud/electriccommander/conf/wrapper.conf
RUN echo "set.default.COMMANDER_IGNORE_PASSKEY_MISMATCH=1" >> /opt/electriccloud/electriccommander/conf/wrapper.conf

EXPOSE 8443 443 61613 8000 5445-5449

CMD /tmp/initiate_zoo.sh && /etc/init.d/commanderServer start && tail -F /opt/electriccloud/electriccommander/logs/commander-`hostname`.log
