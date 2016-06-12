# Using CentOS 6 base image
# Version 1

# Pull the CentOS image from the local repository
FROM centos:6
MAINTAINER Ken Evensen <kevensen@redhat.com>

LABEL io.openshift.expose-services="3389:tcp"

USER root

ENV HOME /home/1001

RUN yum install -y tigervnc-server && \
    yum clean all && \
    rm -rf /var/cache/yum/*

RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm && \
    yum install -y --setopt=tsflags=nodocs \
                   xrdp \
                   supervisor && \
    yum clean all && \
    rm -rf /var/cache/yum/*

RUN useradd -u 1001 -r -g 0 -d ${HOME} -s /sbin/nologin -c "Kiosk User" kioskuser

ADD xrdp_config /usr/bin/

RUN chmod a+x /usr/bin/xrdp_config && \
    chmod g+w /etc/xrdp && \
    chmod u+s /usr/sbin/xrdp-sesman && \
    chmod u+s /usr/sbin/xrdp && \
    mkdir -p /home/1001 && \
    chown -R 1001:0 ${HOME} 

ADD supervisord.conf /etc/supervisord/supervisord.conf
EXPOSE 3389
WORKDIR ${HOME}

USER kioskuser

ENTRYPOINT /usr/bin/xrdp_config; /usr/bin/supervisord -c /etc/supervisord/supervisord.conf

