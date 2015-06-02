$Env:Path = "${Env:Path};c:\Program Files (x86)\Git\bin"

$Env:DOCKER_HOST = "tcp://192.168.59.103:2376"
$Env:DOCKER_CERT_PATH = "$env:USERPROFILE\.boot2docker\certs\boot2docker-vm"
$Env:DOCKER_TLS_VERIFY = "1"

# boot2docker restart will reset DHCP IP Address to 172.17.0.1
boot2docker restart
boot2docker start

#remove existing names
Write-Host
Write-host "Stop/remove any pre-existing container tags"

docker rm -f ra

# Start RA Container (Start RA first to get IP 172.17.0.1)
docker run -itd --name ra -e MYSQL_ROOT_PASSWORD=password -p 8080:8080 -it caiw/ra bin/bash
docker exec ra /usr/local/ReleaseAutomationServer/nolio_server.sh start
docker exec ra /usr/local/CA/ReleaseAutomationAgent/nolio_agent.sh start