FROM alpine:latest
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN (apk --update add transmission-daemon tzdata && rm -rf /var/cache/apk/* &&\
  mkdir -p /var/lib/transmission/.config/transmission-daemon &&\
  chown -R transmission:transmission /var/lib/transmission &&\
  ln -sf /usr/share/zoneinfo/US/Eastern /etc/localtime)

COPY settings.json /var/lib/transmission/.config/transmission-daemon/settings.json

RUN (chown transmission:transmission /var/lib/transmission/.config/transmission-daemon/settings.json &&\
  chmod 600 /var/lib/transmission/.config/transmission-daemon/settings.json)

USER transmission
WORKDIR /var/lib/transmission
EXPOSE 9091 51413/tcp 51413/udp
VOLUME ["/var/lib/transmission"]

ENTRYPOINT ["/usr/bin/transmission-daemon"]
CMD ["-f","--log-error","--log-info"]
