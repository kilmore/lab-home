
Default Configurations:
/etc/opt/jfrog/artifactory/default

ARTIFACTORY_HOME = /var/opt/jfrog/artifactory

```
# Create the 
mkdir -p $ARTIFACTORY_HOME/access/etc
sudo chmod 600 $ARTIFACTORY_HOME/access/etc/bootstrap.creds
```

curl -u "admin:Password@2" -d "@data.json" -X PUT http://localhost:8081/artifactory/api/repositories/libs-release-local

https://www.jfrog.com/confluence/display/ACC/Configuring+Access
https://www.jfrog.com/confluence/display/RTF/Installing+Artifactory

API
https://www.jfrog.com/confluence/display/RTF/Artifactory+REST+API#ArtifactoryRESTAPI-Usage

## Scratch Area
## --------------------------------------------------------------
$ARTIFACTORY_HOME/etc/security/access/bootstrap.creds 
$ARTIFACTORY_HOME/access/etc 

/opt/jfrog/artifactory

/etc/opt/jfrog/artifactory/default

export ARTIFACTORY_HOME=/var/opt/jfrog/artifactory


wget https://bintray.com/jfrog/artifactory-pro-rpms/rpm -O bintray-jfrog-artifactory-pro-rpms.repo
sudo mv bintray-jfrog-artifactory-pro-rpms.repo /etc/yum.repos.d/
sudo yum install jfrog-artifactory-pro