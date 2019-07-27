#!/bin/bash

export ARTIFACTORY_HOME=/var/opt/jfrog/artifactory

# This is needed for Tomcat (installed by artifactory) and Artifactory
sudo yum install -y java

# Install Artifactory
wget https://bintray.com/jfrog/artifactory-pro-rpms/rpm -O bintray-jfrog-artifactory-pro-rpms.repo
sudo mv bintray-jfrog-artifactory-pro-rpms.repo /etc/yum.repos.d/
sudo yum install jfrog-artifactory-pro -y
sudo service artifactory start

# Check to see that artifactory is up and ready
# The Artifactory startup routine can take some time. 
# We curl the status enpoint to see when it is ready go.

ready="NO"
checkCount=0
while [ $ready != "OK" ]
do
     # Initialize the check counter. this will track how many times we are in the loop
     checkCount=$((checkCount++))

     # Napping for 30 seconds before check, because napping is good.
     echo "Sleeping for 30 seconds"
     sleep 30
     echo "Check number $checkCount to See if Artifactory is Ready"
     reponse=$(curl http://localhost:8081/artifactory/api/system/ping)

     # We need to avoid the infinte loop
     if [ $checkCount -eq 6 ]; then
          echo "Exiting after 6 attempts"
          exit 1
     fi
       
     if [ $(echo -n $response | wc -m) -gt 2 ]; then 
          ready="NO"
     else 
          ready="OK"
     fi 
done



# Install Artifactory License Key
artifactoryLicense=$(cat /tmp/files/artifactory.lic)
echo "{\"licenseKey\":\"$artifactoryLicense\"}" > data.json
curl -u "admin:password" -d "@data.json" -H "Content-Type: application/json" -X POST http://localhost:8081/artifactory/api/system/licenses