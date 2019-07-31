#!/bin/bash

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
# Here we are using curl... this should really be replaces with 
# a Python script or an inspec test.
ready="NO"
checkCount=0
while [ $ready != "OK" ]
do
     # Initialize the check counter. this will track how many times we are in the loop
     checkCount=$((checkCount++))

     # We need to avoid the infinte loop if the checkCout is greater than six it means we have been
     # waitiing more than 6 minutes. For this lab seetup that means something has gone horribly wrong
     if [ $checkCount -eq 6 ]; then
          echo "Exiting after 6 attempts"
          exit 1
     fi

     # Napping for 60 seconds before check, because napping is good.
     echo "Sleeping for 60 seconds"
     sleep 60
     echo "Check number $checkCount to See if Artifactory is Ready"
     reponse=$(curl http://localhost:8081/artifactory/api/system/ping)

     # Here we check for the word count on the response. Using the raw response has 
     # unescaped special characters that "blow up" a standard comparions. 
     # The response we are looking for from Artifactory is "OK" when Artifactory is 
     # Ready. When Artifactory is still starting up we get the content of the holding page
     wordCount=$(echo -n $response | wc -m)

     if [ $(echo -n $response | wc -m) -gt 2 ]; then 
          ready="NO"
     else 
          ready="OK"
     fi 
done

# Install Artifactory License Key
artifactoryLicense=$(cat /tmp/configs/artifactory.lic)
echo "{\"licenseKey\":\"$artifactoryLicense\"}" > data.json
curl -u "admin:password" -d "@data.json" -H "Content-Type: application/json" -X POST http://localhost:8081/artifactory/api/system/licenses

# Create a repo
curl -u "admin:password" -d "@/tmp/configs/local-release.json" -X PUT http://localhost:8081/artifactory/api/repositories/libs-release-local