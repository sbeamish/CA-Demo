$Env:Path = "${Env:Path};c:\Program Files (x86)\Git\bin"

$Env:DOCKER_HOST = "tcp://192.168.59.103:2376"
$Env:DOCKER_CERT_PATH = "$env:USERPROFILE\.boot2docker\certs\boot2docker-vm"
$Env:DOCKER_TLS_VERIFY = "1"

boot2docker start

# Setup Docker Demo commands
#docker pull mysql:tag
#docker pull devtest:tag
#docker pull rademo:tag

#remove existing names
Write-Host
Write-host "Removing any pre-existing container tags"
docker rm -f ra
docker rm -f mysql

# Start building commands
docker run --name mysql -e MYSQL_ROOT_PASSWORD=cademo -d mysql
docker run -it --name ra  --link mysql:mysql -v //E:/Source:/opt/share ubuntu:14.04

####