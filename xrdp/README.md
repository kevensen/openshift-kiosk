# CentOS XRDP
Run Firefox inside a CentOS 6 based docker container.  This is the second container you should build, after kevensen/centos-vnc-firefox.

Or simply pull the image
```
docker pull docker.io/kevensen/centos-xrdp
```

## Build the Container
```
docker build -t kevensen/centos-xrdp .
```

## Run the Container
Run the container and test the connection with your favorite XRDP viewer.  The password is `kioskuser`.
```
docker run -d -p 3389:3389 --link vnc --name xrdp kevensen/centos-xrdp
```
