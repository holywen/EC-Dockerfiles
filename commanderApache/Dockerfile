FROM holywen/commanderbase
MAINTAINER Shaohua Wen

RUN addgroup ubuntu
RUN useradd -m -g ubuntu ubuntu
RUN /tmp/ElectricFlow-* --mode silent --installAgent --installWeb --unixServerUser ubuntu --unixServerGroup ubuntu --unixAgentUser ubuntu --unixAgentGroup ubuntu --remoteServer haproxy
RUN rm -f /tmp/ElectricFlow-*

#disable the https rewrite rule in the web server
RUN  sed -i -e 's/RewriteCond %{HTTPS} !=on/#RewriteCond %{HTTPS} !=on/g' /opt/electriccloud/electriccommander/apache/conf/httpd.conf
RUN  sed -i 's/RewriteRule ^\/(.*)/#RewriteRule ^\/(.*)/g' /opt/electriccloud/electriccommander/apache/conf/httpd.conf

EXPOSE 80 443
CMD /etc/init.d/commanderApache start && /etc/init.d/commanderAgent console
