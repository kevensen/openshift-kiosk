FROM openshift/mysql-55-centos7

MAINTAINER Kenneth D. Evensen <kevensen@redhat.com>

USER root
RUN yum install git tar -y; yum clean all; rm -rf /var/cache/yum; git clone https://github.com/glyptodon/guacamole-docker.git /opt/guacamole-docker
RUN export $(grep -e "^ *GUAC_JDBC_VERSION" /opt/guacamole-docker/Dockerfile); /opt/guacamole-docker/bin/download-jdbc-auth.sh "$GUAC_JDBC_VERSION" /opt/guacamole
RUN /opt/guacamole-docker/bin/initdb.sh --mysql > /initdb.sql; chown mysql:mysql /initdb.sql
USER mysql
