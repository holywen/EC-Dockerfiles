FROM holywen/commanderbase
MAINTAINER Shaohua Wen

ARG EFLOW_INSTALLER

RUN addgroup ubuntu
RUN useradd -m -g ubuntu ubuntu

ADD ${EFLOW_INSTALLER} /tmp/
RUN chmod +x /tmp/${EFLOW_INSTALLER}
RUN /tmp/${EFLOW_INSTALLER} --mode silent --installRepository --installAgent --unixServerUser ubuntu --unixServerGroup ubuntu --unixAgentUser ubuntu --unixAgentGroup ubuntu --remoteServer haproxy
RUN rm -f /tmp/${EFLOW_INSTALLER}

EXPOSE 8200

CMD /etc/init.d/commanderRepository start && /etc/init.d/commanderAgent console
