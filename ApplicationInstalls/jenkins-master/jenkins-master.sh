#!/bin/bash

# Jenkins is run via container

sudo su 
mv /tmp/configs/ /opt/jenkins/
cd /opt/jenkins 
docker build -t jcasc:latest -f /opt/jenkins/Dockerfile .
docker-compose -f /opt/jenkins/docker-compose.yaml up -d 