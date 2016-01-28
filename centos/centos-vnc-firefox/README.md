# CentOS VNC Firefox
## Building the container
```bash
docker build -t kevensen/centos-vnc-firefox
```
## Running the container
```bash
docker run --name vnc -d -p 5901:5901 kevensen/centos-vnc-firefox
```
