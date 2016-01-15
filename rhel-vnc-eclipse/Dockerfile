# Using the VNC image to run Eclipse
# Version 1

FROM $OPENSHIFT_BUILD_NAMESPACE/rhel-vnc:latest

MAINTAINER Ken Evensen

USER root
RUN yum groupinstall Eclipse; yum clean all; rm -rf /var/cache/yum
RUN /bin/echo "/usr/bin/eclipse" >> /home/basicuser/.vnc/xstartup 
USER basicuser
