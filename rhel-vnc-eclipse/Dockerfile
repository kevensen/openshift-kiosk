# Using the VNC image to run Eclipse
# Version 1

FROM kiosk/rhel-vnc
MAINTAINER Ken Evensen

USER root
RUN yum install -y --enablerepo=rhel-server-rhscl-6-rpms --enablerepo=rhel-6-server-optional-rpms devtoolset-4-ide spice-xpi; yum clean all; rm -rf /var/cache/yum
RUN /bin/echo "/usr/bin/firefox" >> /home/basicuser/.vnc/xstartup 
USER basicuser
