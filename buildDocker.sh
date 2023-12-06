#!/bin/bash

# Stop and remove both containers and the image
NAME=geepidev/weather-app:latest

sudo docker container stop ${NAME}
sudo docker container rm ${NAME}
sudo docker image rm ${NAME}

# Now build a new image and push it
sudo docker build -t ${NAME} .
sudo docker push ${NAME}

# Let's run the 
sudo docker run -d -p 80:8090 --name weather-app ${NAME}

