# proxysql

Docker ProxySQL image
Supported tags and respective Dockerfile links

Build and update process

This image is automatically built at every push of this repository and every time that the debian:jessie base image gets updated in order to ensure that bugfixes and security updates are immediately applied.
Run

docker run -v /path/to/proxysql.cfg:/etc/proxysql.cfg svallier/proxysql:1.1

Or, you can create your own derived image, with the configuration in the image itself.

FROM prima/proxysql:1.1
COPY my-config/proxysql.cfg /etc/proxysql.cfg
