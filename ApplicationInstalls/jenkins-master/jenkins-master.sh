#!/bin/bash

# Jenkins is run via container
echo "==== Jenkins INSTALL STARTING =============================================================================="

sudo su 
mv /tmp/jenkins/ /opt/jenkins/
cd /opt/jenkins 
docker build -t jcasc:latest -f /opt/jenkins/Dockerfile .
docker-compose -f /opt/jenkins/docker-compose.yaml up -d 

echo "==== Jenkins INSTALL COMPLETE =============================================================================="