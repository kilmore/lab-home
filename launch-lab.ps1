# Startup Workstation
$command = "vagrant up workstation"
Invoke-Expression $command

# Startup Name Services
# $command = "vagrant up ns0"
# Invoke-Expression $command

# Startup LDAP
$command = "vagrant up ldap"
Invoke-Expression $command

# Startup Artifactory
$command = "vagrant up artifactory"
Invoke-Expression $command

# Startup Jenkins-Master
$command = "vagrant up jenkins-master"
Invoke-Expression $command

# Startup Kubernetes