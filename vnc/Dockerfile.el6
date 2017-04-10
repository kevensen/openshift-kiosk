# Using CentOS 6 base image and VNC
# Version 1

# Pull the rhel image from the local repository
FROM centos:6
MAINTAINER Ken Evensen

LABEL io.openshift.expose-services="5901:tcp"

USER root
ENV DISPLAY="" \
    HOME=/home/1001

ARG vncpassword=password

RUN yum clean all && \
    yum update -y && \
    yum install -y --setopt=tsflags=nodocs \
                   tigervnc-server \
    		   xorg-x11-server-utils \
                   xorg-x11-server-Xvfb \
                   xorg-x11-fonts-* \
                   xterm && \
                   yum clean all && \
                   rm -rf /var/cache/yum

RUN yum install -y --setopt=tsflags=nodocs \
                  openmotif \
                  xterm \
                  firefox \
                  yum clean all && \
                  rm -rf /var/cache/yum/*

RUN /bin/dbus-uuidgen --ensure
RUN useradd -u 1001 -r -g 0 -d ${HOME} -s /bin/bash -c "Kiosk User" kioskuser

ADD xstartup ${HOME}/.vnc/
RUN echo "${vncpassword}" | vncpasswd -f > ${HOME}/.vnc/passwd
RUN touch /home/1001/.Xauthority

RUN chown -R 1001:0 ${HOME} && \
    chmod 775 ${HOME}/.vnc/xstartup && \
    chmod 600 ${HOME}/.vnc/passwd

EXPOSE 5901
WORKDIR ${HOME}
USER 1001
ENTRYPOINT ["/usr/bin/vncserver","-fg"]
