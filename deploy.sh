docker stop $(docker ps -as)
docker rm $(docker ps -as)
docker rmi $(docker images)
docker build -t proxysql .
docker run -d -p 6032:6032 -e MASTER="172.30.2.60" -e SLAVE1="172.30.2.61" SLAVE1="172.30.2.62" -e OMPDB_PASS="uG40TSRJ" --restart on-failure proxysql
docker exec -ti proxysql bash
