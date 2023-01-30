#!/bin/bash

version=$1

[ -z $version ] && version=0.1 && echo "\nset defaul version 0.1\n"

docker build --no-cache -t nestorsanchezz/portafolio:$version .

docker tag nestorsanchezz/portafolio:$version nestorsanchezz/portafolio:latest

docker push nestorsanchezz/portafolio:$version
docker push nestorsanchezz/portafolio:latest

ssh -o StrictHostKeyChecking=no -i ./personal-key.pem ubuntu@sancheznestor.com "cd /home/ubuntu/NestorConfigServer && make reload service=portafolio"