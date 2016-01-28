# OpenShift Kiosk (CentOS)
This folder contains the components for the CentOS based kiosk.

## Getting Started
If you wish to build or run a kiosk without OpenShift, you should build and run the Docker containers in the following order.

1.) [centos-vnc](centos-vnc)

2.) [centos-vnc-firefox](centos-vnc-firefox) or [centos-vnc-eclipse](centos-vnc-eclipse)

3.) [centos-xrdp](centos-xrdp)

If you are able to connect to the XRDP session and/or the VNC connection with your favorite viewer, you are good to go adding Guacamole.
## Adding Glyptodon Guacamole
The Dockerized version of the <a href="https://github.com/glyptodon/guacamole-docker">Guacamole client</a> uses database authentication, eith MySQL or PostgreSQL.  This is entirely up to you.  For the sake of this example, let's use MySQL.

Pull down the CentOS based MySQL container.
```bash
docker pull openshift/mysql-55-centos7
```
Execute the container
```bash
docker run --name mysql -d -p 3306:3306 -e MYSQL_USER=guacamole_user -e MYSQL_PASSWORD=guacamole_password -e MYSQL_DATABASE=guacamole_db openshift/mysql-55-centos7
```
The next step is to pull the <a href="https://github.com/glyptodon/guacd-docker">Guacamole server</a>
```bash
docker pull glyptodon/guacd
```
Then run the container
```bash
docker run --name guacd -d -p 4822:4822 docker.io/glyptodon/guacd
```
Follow the steps for the <a href="https://github.com/glyptodon/guacamole-docker">Guacamole client</a>.  You must initialize the database before attempting to authenticate.

Then you can run the client
```bash
docker run --name some-guacamole --link guacd \
    --link mysql         \
    -e MYSQL_DATABASE=guacamole_db  \
    -e MYSQL_USER=guacamole_user    \
    -e MYSQL_PASSWORD=guacamole_password \
    -d -p 8080:8080 glyptodon/guacamole
```
