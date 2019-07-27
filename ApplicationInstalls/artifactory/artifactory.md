## Summary

## Things to know
* The default configuration for things like ARTIFACTORY_HOME and TOMCAT_HOME is located in `/etc/opt/jfrog/artifactory/default`




## Resources:
* [Installing Artifactory](https://www.jfrog.com/confluence/display/RTF/Installing+Artifactory)
* [Artifactory API](https://www.jfrog.com/confluence/display/RTF/Artifactory+REST+API#ArtifactoryRESTAPI-Usage)





https://www.jfrog.com/confluence/display/ACC/Configuring+Access


API


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