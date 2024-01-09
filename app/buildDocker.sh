#!/bin/bash

# Stop and remove both containers and the image
DOCKER_TAG=$1
DOCKER_PAT=$2
NAME=geepidev/weather-app:${DOCKER_TAG}
sudo docker container stop ${NAME}
sudo docker container rm ${NAME}
sudo docker image rm ${NAME}

# Now build a new image and push it
sudo docker build -t ${NAME} .
sudo docker login -u geepidev -p ${DOCKER_PAT}
sudo docker push ${NAME}

# Let's run the 
sudo docker run -d -p 80:8090 --name weather-app ${NAME}

