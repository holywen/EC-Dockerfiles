FROM holywen/commanderbase
MAINTAINER Shaohua Wen
 
ARG EFLOW_INSTALLER

RUN addgroup ubuntu
RUN useradd -m -g ubuntu ubuntu

ADD ${EFLOW_INSTALLER} /tmp/
RUN chmod +x /tmp/${EFLOW_INSTALLER}
RUN /tmp/${EFLOW_INSTALLER}  --mode silent --installServer --unixServerUser ubuntu --unixServerGroup ubuntu --unixAgentUser ubuntu --unixAgentGroup ubuntu
RUN rm -f /tmp/${EFLOW_INSTALLER}

COPY ./mysql-connector-java.jar /opt/electriccloud/electriccommander/server/lib/mysql-connector-java.jar

#ignore the server mismatch and passkey mismatch
RUN echo "set.default.COMMANDER_IGNORE_SERVER_MISMATCH=1" >> /opt/electriccloud/electriccommander/conf/wrapper.conf
RUN echo "set.default.COMMANDER_IGNORE_PASSKEY_MISMATCH=1" >> /opt/electriccloud/electriccommander/conf/wrapper.conf

EXPOSE 8443 61613 8000 5445-5449

CMD chmod +x /tmp/scripts/*.sh && /tmp/scripts/initiate_zoo.sh && /etc/init.d/commanderServer start && tail -F /opt/electriccloud/electriccommander/logs/commander-`hostname`.log
