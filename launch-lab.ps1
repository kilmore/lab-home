# Startup Workstation
$command = "vagrant up workstation"
Invoke-Expression $command

# Startup Name Services

# Startup LDAP
$command = "vagrant up ldap"
Invoke-Expression $command

# Startup Artifactory
$command = "vagrant up artifactory"
Invoke-Expression $command

# Startup Kubernetes