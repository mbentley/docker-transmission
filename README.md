mbentley/transmission
=====================

docker image for transmission

To pull this image:
`docker pull mbentley/transmission`

Example usage:
`docker run -d --net=host -v /local/path/to/transmission-daemon:/var/lib/transmission-daemon --name transmission mbentley/transmission`
