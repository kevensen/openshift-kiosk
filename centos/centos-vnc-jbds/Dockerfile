# Using the VNC image to JBoss Developer Studio
# Version 1

FROM kevensen/centos-vnc

MAINTAINER Kenneth D. Evensen <kevensen@redhat.com>

USER root
RUN yum groupinstall -y Eclipse && yum clean all; rm -rf /var/cache/yum
RUN /bin/echo "/usr/bin/eclipse" >> /home/kioskuser/.vnc/xstartup 
USER kioskuser
