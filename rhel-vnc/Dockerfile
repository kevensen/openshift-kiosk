# Using CentOS 6 base image and VNC
# Version 1

# Pull the rhel image from the local repository
FROM rhel6.7
MAINTAINER Ken Evensen

LABEL io.openshift.expose-services="5901:tcp"

USER root
RUN yum install -y tigervnc-server \
                   xorg-x11-server-utils \
                   xterm \
                   gnome-session dbus; yum clean all; rm -rf /var/cache/yum
RUN /bin/dbus-uuidgen --ensure

RUN useradd basicuser; mkdir -p /home/basicuser/.vnc
ADD xstartup /home/basicuser/.vnc/
ADD passwd /home/basicuser/.vnc/
RUN chown -R basicuser:basicuser /home/basicuser; chmod a+x /home/basicuser/.vnc/xstartup; chmod 600 /home/basicuser/.vnc/passwd
EXPOSE 5901

ENTRYPOINT ["/usr/bin/vncserver", "-fg"]
