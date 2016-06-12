# CentOS VNC

## Building the container
```bash
$ docker build -t kevensen/centos-vnc .
```
Or if you'd like to change the default password
```bash
docker build --build-arg vncpassword=<somepassword> kevensen/centos-vnc .
```
## Running the container
This container does not get run directly.
