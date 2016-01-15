# Using RHEL 6 base image
# Version 1

# Pull the rhel image from the local repository
FROM rhel6.7
MAINTAINER Ken Evensen <kevensen@redhat.com>

LABEL io.openshift.expose-services="3389:tcp"

USER root
RUN yum install -y tigervnc-server; yum clean all; rm -rf /var/cache/yum
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm; yum install -y xrdp supervisor; yum clean all; rm -rf /var/cache/yum
ADD xrdp_config /usr/bin/
RUN chmod u+x /usr/bin/xrdp_config
ADD supervisord.conf /etc/
EXPOSE 3389
ENTRYPOINT /usr/bin/xrdp_config; /usr/bin/supervisord
