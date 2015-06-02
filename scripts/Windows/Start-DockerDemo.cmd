set DOCKER_TLS_VERIFY=1
set DOCKER_HOST=tcp://192.168.59.103:2376
set DOCKER_CERT_PATH=C:\Users\scott\.boot2docker\certs\boot2docker-vm

boot2docker start

REM Remove any pre-existing containers
docker rm -f ra
docker rm -f mysql
docker rm -f devtest
docker rm -f cms

REM Start Containers
REM docker run -d --name mysql -e MYSQL_ROOT_PASSWORD=cademo mysql 
REM docker run -itd --name cms -p 8090:8080 -p 9990:9990 caiw/cms

REM Start RA Container
docker run -itd --name ra --expose 3306 -e MYSQL_ROOT_PASSWORD=password -p 8099:8080 -it caiw/ra bin/bash

REM Start DevTest container
docker run -itd --name devtest -p 15006:1506 -p 15005:1505 -p 15007:1507 -p 20008:2008 -p 20009:2009 -p 20100:2010 -p 20130:2013 -p 20140:2014 -p 10980:1098 -p 10990:1099 -p 8081:8081 -p 8082:8082 -p 9090:9090 caiw/devtest:8.0.2 /bin/bash
docker exec -it devtest /usr/local/CA/DevTest/bin/entrypoint.sh
