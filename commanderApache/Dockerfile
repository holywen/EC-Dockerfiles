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
    /tmp/ElectricFlowInstaller --mode silent --installAgent --installWeb --unixServerUser ubuntu --unixServerGroup ubuntu --unixAgentUser ubuntu --unixAgentGroup ubuntu --remoteServer haproxy && \
    rm -f /tmp/ElectricFlowInstaller

#disable the https rewrite rule in the web server
RUN  sed -i -e 's/RewriteCond %{HTTPS} !=on/#RewriteCond %{HTTPS} !=on/g' /opt/electriccloud/electriccommander/apache/conf/httpd.conf
RUN  sed -i 's/RewriteRule ^\/(.*)/#RewriteRule ^\/(.*)/g' /opt/electriccloud/electriccommander/apache/conf/httpd.conf

EXPOSE 80 443
CMD /etc/init.d/commanderApache start && /etc/init.d/commanderAgent console
