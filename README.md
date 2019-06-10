# Samba Docker Image

Samba server in a docker container.

## Getting started

```
# Build the image
docker-compose build

# Configure samba password for samba user
docker-compose run --rm samba smbpasswd -a $SAMBA_USER

# Run the samba server
docker-compose run -d

#
# Mounting the share on the client side
#
sudo mount -t cifs //$HOSTNAME/share $MOUNT_POINT -o username=$SAMBA_USER,workgroup=WORKGROUP,ip=$SERVER_IP_ADDRESS,iocharset=utf8
```

### Parameters

- $SAMBA_USER and $SAMBA_GROUP are set in the Dockerfile
- $HOSTNAME of the Samba server
- $MOUNT_POINT - where to mount share at the client
- $SERVER_IP_ADDRESS - ip address of Samba server

## Tuning

A simple smb.conf with a single share is provided in this repository which can
To add more shares/modify the existing one this file can be modified 
along with the Dockerfile and the docker-compose.yml files.

## Testing

The image was tested on a Raspberry Pi 3 running HypriotOS v1.10.0:

```
$ uname -a
Linux black-pearl 4.14.98-v7+ #1200 SMP Tue Feb 12 20:27:48 GMT 2019 armv7l GNU/Linux
$ docker --version
Docker version 18.06.3-ce, build d7080c1
```
