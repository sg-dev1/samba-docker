FROM alpine:latest

RUN apk add --no-cache --update \
    samba-common-tools \
    samba-client \
    samba-server && rm -rf /var/cache/apk/*

COPY smb.conf /etc/samba/smb.conf
EXPOSE 139/tcp 445/tcp
VOLUME "/var/lib/samba"

# user pi to be used as smbuser
ARG SAMBA_USER=pi
ARG SAMBA_GROUP=pi

# very important to set here 1000 for uid/gid else there could be an issue of share not
# writable when mounted at the client side
RUN addgroup -g 1000 $SAMBA_GROUP && adduser -D -H -s /bin/false -u 1000 $SAMBA_USER -G $SAMBA_GROUP

# --no-process-group was required else startup failed
CMD ["smbd", "--foreground", "--log-stdout", "--no-process-group"]
