set DOCKER_TLS_VERIFY=1
set DOCKER_HOST=tcp://192.168.59.103:2376
set DOCKER_CERT_PATH=C:\Users\scott\.boot2docker\certs\boot2docker-vm

REM restart will reset DHCP IP Address to 172.17.0.1
boot2docker restart
boot2docker start

REM Remove any pre-existing containers
docker rm -f ra

REM Start RA Container (Start RA first to get IP 172.17.0.1)
docker run -itd --name ra -e MYSQL_ROOT_PASSWORD=password -p 8080:8080 -it caiw/ra bin/bash
docker exec ra /usr/local/ReleaseAutomationServer/nolio_server.sh start
docker exec ra /usr/local/CA/ReleaseAutomationAgent/nolio_agent.sh start