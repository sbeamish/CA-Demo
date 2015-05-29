$Env:Path = "${Env:Path};c:\Program Files (x86)\Git\bin"

$Env:DOCKER_HOST = "tcp://192.168.59.103:2376"
$Env:DOCKER_CERT_PATH = "$env:USERPROFILE\.boot2docker\certs\boot2docker-vm"
$Env:DOCKER_TLS_VERIFY = "1"

boot2docker start

#remove existing names
Write-Host
Write-host "Stop/remove any pre-existing container tags"

docker rm -f ra
docker rm -f mysql
docker rm -f devtest
docker rm -f cms

#remove existing names
Write-Host
Write-host "Start containers"

docker run -d --name mysql -e MYSQL_ROOT_PASSWORD=cademo mysql 
docker run -itd --name cms -p 8090:8080 -p 9990:9990 caiw/cms
docker run -itd --name ra --link mysql:mysql --link cms:cms -p 8080:8080 -v /c/Users:/mnt ubuntu:14.04 bin/bash

docker run -itd --name devtest -p 15006:1506 -p 15005:1505 -p 15007:1507 -p 20008:2008 -p 20009:2009 -p 20100:2010 -p 20130:2013 -p 20140:2014 -p 10980:1098 -p 10990:1099 -p 8081:8081 -p 8082:8082 -p 9090:9090 caiw/devtest:8.0.2 /bin/bash
docker exec -it devtest /usr/local/CA/DevTest/bin/entrypoint.sh