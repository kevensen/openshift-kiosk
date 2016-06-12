# CentOS VNC Eclipse
## Building the container
```bash
$ docker build -t kevensen/centos-vnc-eclipse .
```
## Running the container
```bash
$ docker run --name vnc -d -p 5901:5901 kevensen/centos-vnc-eclipse
```
