# Openshift Kiosk
Docker has arguably triggered innovation at an unprecedented scale for containerizing scalable applications.  Red Hat's OpenShift 3.x capitalizes on this open source technology to enable a true Devops effort.  Do you need OpenShift to be able to use these images?  NO!  The README's in the various folders can help get you going simply by using Docker.

This kiosk framework allows you to run various desktop applications in Docker containers.  In the simplest case, the applications are accessed via a VNC or XRDP connection.  Wouldn't it be cool if these applications could be used in a web console (a web browser)?  <a href="https://glyptodon.org/">Glyptodon's</a> HTML5 desktop gateway, <a href="https://guac-dev.org/">Guacamole</a>, enables just that.  They've even gone to the lengths as to Dockerize their framework.  This makes it easy to string all the pieces together for a web based, Dockerized desktop kiosk.

You do not need to use Guacamole to take advantage of the barebones kiosk, but it does increase usability.

## Architecture
In Docker fashion, the Docker images are constructed in a layered manner.

For example, the centos/centos-vnc container simply installs the base Gnome desktop as well as a Tiger VNC server.  Applications are then installed via separate Docker files using the centos-vnc image.

## Project Layout
This framework is organized into CentOS and RHEL based images.  

The CentOS images are built automatically on <a href="hub.docker.com">Docker Hub</a>.  Simply invoking a "docker pull" will allow you to obtain the desired image.  Should you wish to deploy the CentOS based images to OpenShift, the images are pulled from Docker Hub.  In other words, there are no build configs for these images in the yaml templates.

On the other hand, the RHEL based images will need to be constructed in your own environment.  This shouldn't be a big deal; but it just takes a little more time.

## Getting Started
If you wish to build or run a kiosk without OpenShift, I recommend you look at content in the "centos" folder.  From there, you should build and run the Docker containers in the following order.

1.) centos-vnc

2.) centos-vnc-firefox and/or centos-vnc-eclipse

3.) centos-xrdp

4.) mysql-guacamole

From there, I would move on to running Guacamole.
