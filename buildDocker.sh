#!/bin/bash

# Stop and remove both containers and the image
sudo docker container stop weather-app
sudo docker container rm weather-app
sudo docker image rm weather-app:latest

# Now build a new image and push it
sudo docker build -t weather-app:latest .
#sudo docker push geepidev/node_weather

# Let's run the 
sudo docker run -d -p 80:8090 --name weather-app weather-app:latest
