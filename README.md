# proxysql

Docker ProxySQL image
Supported tags and respective Dockerfile links

Build and update process
This image is automatically built at every push of this repository and every time that the debian:jessie base image gets updated in order to ensure that bugfixes and security updates are immediately applied.
Run

docker run -d -p 6032:6032 -e MASTER="IPAdressOfMasterSQL" -e SLAVE1="IPAdressOfFirstSQLSlave" -e SLAVE2="IPAdressOfSecondSQLSlave" -e OMPDB_PASS="PASSWORD" --restart=on-failure svallier/proxysql
