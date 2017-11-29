#!/bin/bash

/etc/init.d/proxysql start
sleep 2


/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_servers(hostgroup_id, hostname, port, comment) VALUES (0,'$MASTER',3306,'WRITES');"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_servers(hostgroup_id, hostname, port, comment) VALUES (1,'$MASTER',3306,'READS');"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_servers(hostgroup_id, hostname, port, comment) VALUES (1,'$SLAVE1',3306,'READS');"

if [ ! -z "$SLAVE2" ];then
	/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_servers(hostgroup_id, hostname, port, comment) VALUES (1,'$SLAVE2',3306,'READS');"
fi


/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^select',1,0);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^show',1,1);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules (active, match_pattern, destination_hostgroup, apply) VALUES (1, '^SELECT.*FOR UPDATE', 0, 1);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^truncate',0,1);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^savepoint',0,1);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^restore',0,1);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^revoke',0,1);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^reset',0,1);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^repair',0,1);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^rename',0,1);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^purge',0,1);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^kill',0,1);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^lock',0,1);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^grant',0,1);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^load',0,1);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^flush',0,1);"
/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_query_rules(active,match_pattern,destination_hostgroup,apply) VALUES(1,'^alter',0,1);"

/usr/bin/mysql -uadmin -padmin -h"127.0.0.1" -P6032  -e "INSERT INTO mysql_users (username,password) VALUES ('ompdb', '$OMP_PASS');"
