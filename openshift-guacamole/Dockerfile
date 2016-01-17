FROM glyptodon/guacamole:latest

MAINTAINER Kenneth D. Evensen

ENV OPENSHIFTIFY_COMMAND 'rm -rf /usr/local/tomcat/webapps/ROOT; mv /usr/local/tomcat/webapps/guacamole /usr/local/tomcat/webapps/ROOT'
RUN sed -i "s#start_guacamole\$#${OPENSHIFTIFY_COMMAND}\n&#" /opt/guacamole/bin/start.sh
