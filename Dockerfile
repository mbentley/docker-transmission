FROM debian:jessie
MAINTAINER Matt Bentley <mbentley@mbentley.net>

# Install pre-reqs
RUN (apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y transmission-daemon)
ADD settings.json /etc/transmission-daemon/settings.json
RUN (ln -sf /usr/share/zoneinfo/US/Eastern /etc/localtime &&\
  chown debian-transmission:debian-transmission /etc/transmission-daemon/settings.json &&\
  chmod 600 /etc/transmission-daemon/settings.json)

USER debian-transmission
WORKDIR /var/lib/transmission-daemon
EXPOSE 9091 51413/tcp 51413/udp
VOLUME ["/var/lib/transmission-daemon"]

ENTRYPOINT ["/usr/bin/transmission-daemon"]
CMD ["-f","--log-error","--log-info"]
