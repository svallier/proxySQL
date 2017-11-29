FROM debian:jessie
MAINTAINER CA|Solutions "s.vallier@cacom.fr"

RUN \
   apt-get update && \
   apt-get -y --no-install-recommends install \
	wget \
	ca-certificates \
	mysql-client

RUN \
   wget https://github.com/sysown/proxysql/releases/download/1.3.0f/proxysql_1.3.0f-debian8_amd64.deb -O /opt/proxysql_1.3.0f-debian8_amd64.deb && \
   dpkg -i /opt/proxysql_1.3.0f-debian8_amd64.deb && \
   rm -f /opt/proxysql_1.3.0f-debian8_amd64.deb && \
   rm -rf /var/lib/apt/lists/*

COPY files/entrypoint.sh /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]
