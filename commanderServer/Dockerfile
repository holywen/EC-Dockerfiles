FROM holywen/commanderbase
MAINTAINER Shaohua Wen
 
ARG EFLOW_INSTALLER
ARG EFLOW_INSTALLER_DOWNLOAD_PATH
ARG EFLOW_DOWNLOAD_USER
ARG EFLOW_DOWNLOAD_PASS

#we have to use a fixed hostname when building the docker image but this is not possible see: http://stackoverflow.com/questions/28898787/how-to-handle-specific-hostname-like-h-option-in-dockerfile
#so we use the script to update the server name settings in command server
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

COPY ./initiate_zoo.sh /tmp
RUN chmod +x /tmp/initiate_zoo.sh

COPY ./import_license_and_create_resource.sh /tmp
RUN chmod +x /tmp/import_license_and_create_resource.sh

EXPOSE 8443 443 61613 8000

CMD /tmp/initiate_zoo.sh && /etc/init.d/commanderServer start && tail -F /opt/electriccloud/electriccommander/logs/commander-`hostname`.log
