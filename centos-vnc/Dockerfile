# Using CentOS 6 base image and VNC
# Version 1

# Pull the rhel image from the local repository
FROM centos:6
MAINTAINER Ken Evensen

LABEL io.openshift.expose-services="5901:tcp"

USER root
ENV DISPLAY ""
RUN yum update -y && yum install -y tigervnc-server \
                   xorg-x11-server-utils \
                   xorg-x11-server-Xvfb \
                   xorg-x11-fonts-Type1 \
                   xorg-x11-fonts-misc \
                   xorg-x11-fonts-75dpi \
                   xorg-x11-fonts-100dpi \
                   xterm \
                   gnome-session && yum clean all; rm -rf /var/cache/yum


RUN /bin/dbus-uuidgen --ensure

RUN useradd kioskuser; mkdir -p /home/kioskuser/.vnc
ADD xstartup /home/kioskuser/.vnc/
ADD passwd /home/kioskuser/.vnc/
RUN chown -R kioskuser:kioskuser /home/kioskuser; chmod 775 /home/kioskuser/.vnc/xstartup; chmod 600 /home/kioskuser/.vnc/passwd

EXPOSE 5901

ENTRYPOINT ["/usr/bin/vncserver","-fg"]
