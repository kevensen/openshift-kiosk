# Using the VNC image to run Firefox
# Version 1

FROM kevensen/centos-vnc

MAINTAINER Kenneth D. Evensen <kevensen@redhat.com>

USER root
RUN yum install -y --setopt=tsflags=nodocs \
                  firefox \
                  yum clean all && \
                  rm -rf /var/cache/yum/*

RUN /bin/echo 'xterm -geometry 80x24+10+10 -ls -title "$VNCDESKTOP Desktop" firefox & ' >> /home/1001/.vnc/xstartup 
RUN /bin/echo 'mwm' >> /home/1001/.vnc/xstartup 
USER 1001
