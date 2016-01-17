# Using the VNC image to run Firefox
# Version 1

#FROM kevensen/centos-vnc

FROM centos-vnc

MAINTAINER Kenneth D. Evensen <kevensen@redhat.com>

USER root
RUN yum install -y firefox spice-xpi; yum clean all; rm -rf /var/cache/yum
RUN /bin/echo "/usr/bin/firefox" >> /home/kioskuser/.vnc/xstartup 
USER kioskuser
