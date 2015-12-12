# centos-xrdp
Run Firefox inside a CentOS 6 based docker container.  This is the second container you should build, after kevensen/centos-vnc.

Or simply pull the image
```
docker pull docker.io/kevensen/centos-xrdp
```

##Instructions for Building
```
docker build -t centos-xrdp .
```

## Instructions for Running without Kubernetes

1.) Run the container and test the connection with your favorite XRDP viewer.  The password is `basicuser`.
```
docker run -d -p 3389:3389 --link vnc --name xrdp centos-xrdp
```
2.) Stop and remove the container.
```
docker stop xrdp
docker rm xrdp
```
3.) Start the container in preparation for the SSH server and tunneling containers
```
docker run -d --link vnc --name xrdp centos-xrdp
```
