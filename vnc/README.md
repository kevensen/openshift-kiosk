# CentOS VNC

## Building the container on EL7
```bash
$ docker build -t kevensen/centos-vnc -f ./Dockerfile.el7
```
Or if you'd like to change the default password based on EL6
```bash
docker build --build-arg vncpassword=<somepassword> kevensen/centos-vnc -f ./Dockerfile.el6
```
Simply replace the Dockerfile with the EL release you choose.

## Running the container
This container does not get run directly.
