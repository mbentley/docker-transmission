mbentley/transmission
=====================

docker image for transmission

To pull this image:
`docker pull mbentley/transmission`

This image also uses tini for the init since proper signal handling isn't done out of the box.

Example usage:
```
docker run -d --restart=always --name transmission \
  -p 9091:9091 -p 51413:51413 -p 51413:51413/udp \
  -v /local/path/to/transmission:/var/lib/transmission \
  mbentley/transmission
```
