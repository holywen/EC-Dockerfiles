FROM holywen/commanderbase
MAINTAINER Shaohua Wen

#we have to use a fixed hostname when building the docker image but this is not possible see: http://stackoverflow.com/questions/28898787/how-to-handle-specific-hostname-like-h-option-in-dockerfile
#so we use the script to update the server name settings in command server
RUN addgroup ubuntu
RUN useradd -m -g ubuntu ubuntu

RUN /tmp/ElectricFlow-* --mode silent --installServer --unixServerUser ubuntu --unixServerGroup ubuntu --unixAgentUser ubuntu --unixAgentGroup ubuntu
RUN rm -f /tmp/ElectricFlow-*

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
