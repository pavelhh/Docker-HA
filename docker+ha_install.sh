#!/bin/bash
###Script for install Docker and Home asistant image on Linux###
###1.Docker installation###
curl -fsSL https://get.docker.com -o get-docker.sh
sudo bash get-docker.sh
###Home Assistant continer instalation from Docker Hub image###
sudo docker pull homeassistant/home-assistant
sudo docker run --init -d \
  --name homeassistant \
  --restart=unless-stopped \
  -v /etc/localtime:/etc/localtime:ro \
  -v /HA_CONFIG:/config \
  --network=host \
  homeassistant/home-assistant:stable
