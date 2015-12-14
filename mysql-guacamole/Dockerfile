FROM registry.access.redhat.com/openshift3/mysql-55-rhel7

MAINTAINER Kenneth D. Evensen <kevensen@redhat.com>

USER root
RUN yum install git tar -y; yum clean all; rm -rf /var/cache/yum; git clone https://github.com/glyptodon/guacamole-docker.git /opt/guacamole-docker
RUN export $(grep -e "^ *GUAC_JDBC_VERSION" /opt/guacamole-docker/Dockerfile); /opt/guacamole-docker/bin/download-jdbc-auth.sh "$GUAC_JDBC_VERSION" /opt/guacamole
RUN mysql -u $MYSQL_USER -p $MYSQL_PASSWORD $MYSQL_DATABASE < /opt/guacamole-docker/bin/initdb.sh --mysql
USER $MYSQL_USER
