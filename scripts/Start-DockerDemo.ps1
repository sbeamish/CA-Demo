$Env:Path = "${Env:Path};c:\Program Files (x86)\Git\bin"

$Env:DOCKER_HOST = "tcp://192.168.59.103:2376"
$Env:DOCKER_CERT_PATH = "C:\Users\scott\.boot2docker\certs\boot2docker-vm"
$Env:DOCKER_TLS_VERIFY = "1"

boot2docker start

# run interactively
#docker run -t -i ubuntu:14.04 echo 'Hello World'
#docker run -t -i ubuntu:14.04 /bin/bash

# run as a daemon
#docker run -d -P training/webapp python app.py

#boot2docker ip

#docker ps

#docker port silly_payne 5000

#docker logs -f silly_payne

#docker top silly_payne

#docker inspect silly_payne


# Setup Docker Demo commands
#docker pull mysql
#docker pull devtest latest
#docker pull rademo latest

#docker run -d ubuntu:14.04 /bin/bash
#docker run -d mysql /bin/bash