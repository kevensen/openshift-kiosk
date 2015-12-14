FROM openshift/mysql:latest
MAINTAINER Kenneth D. Evensen <kevensen@redhat.com>

USER root
ENV MYSQL_USER ${GUACAMOLE_USER}
ENV MYSQL_PASSWORD ${GUACAMOLE_PASS}
ENV MYSQL_DATABASE ${GUACAMOLE_DB}
RUN yum install git tar -y; yum clean all; rm -rf /var/cache/yum; git clone https://github.com/glyptodon/guacamole-docker.git /opt/guacamole-docker
RUN export $(grep -e "^ *GUAC_JDBC_VERSION" /opt/guacamole-docker/Dockerfile); /opt/guacamole-docker/bin/download-jdbc-auth.sh "$GUAC_JDBC_VERSION" /opt/guacamole
