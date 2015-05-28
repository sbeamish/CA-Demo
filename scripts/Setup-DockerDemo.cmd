set DOCKER_TLS_VERIFY=1
set DOCKER_HOST=tcp://192.168.59.103:2376
set DOCKER_CERT_PATH=C:\Users\scott\.boot2docker\certs\boot2docker-vm

REM https://registry.hub.docker.com/repos/caiw/

set uname=sbeamish
set pword=M!dsumm3r
set email=scott.beamish@ca.com

docker login –u %uname% –p pword –e %email%

docker pull caiw/devtest:8.0.2
docker pull caiw/jboss
docker pull/cms