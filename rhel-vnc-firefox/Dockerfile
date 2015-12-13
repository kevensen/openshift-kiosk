# Using the VNC image to run Firefox
# Version 1

FROM 172.30.184.188:5000/kiosk/rhel-vnc:latest
MAINTAINER Ken Evensen

USER root
RUN yum install -y firefox spice-xpi; yum clean all; rm -rf /var/cache/yum
RUN /bin/echo "/usr/bin/firefox" >> /home/basicuser/.vnc/xstartup 
USER basicuser
