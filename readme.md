# Local Lab
This repo is intended to funciton as a local lab. While AWS "can" be cheap somtimes you just need a local lab to test things out. This is an inprogress lab build out. USE AT YOUR OWN RISK. 

## Features
* __Mount Local Code Directory__ - The workstation will mount a local code directory if the VAGRANT_LOCAL_MOUNT environment variable is set. This is useful when you want to write code on your local workstation in your ide of choice (VSCode right?) and then do "stuff" on your workstation. 
* __Centralized SSH Keys__ - The SSH Keys used for this environment are shared. The workstation gets the private key and the other systems get the public key. This means that you can ssh from the workstation to the other nodes. For eash of use I also keep a copy of the private key on my host workstation, so I can access all systems in the environment right from my host. 
* __Local Data Mount__ - It is useful to have your vagrant guests persist data to your host. This way you can destroy and rebuild as needed. This is done by setting the VAGRANT_DATA_MOUNT environment variable. 

## Systems
| System      |  Description   |
|-------------|----------------|
| Workstation | This is an ubuntu 16 install that has lots of useful tools (ansibile, terraform, etc.) |
| ns0         | Name server for the environment. __NOT YET CONFIGURED__  |
| consul0     | Key/Vale server for the environment. __NOT YET CONFIGURED__ |
| jenkins-master |  Jenkins master for the environment. __Configuration in Progress__ |


<!--
Other Systems on the grand plan
jenkins-agent0, agent1 <-- Build agents for Jenkins, because... well, it would be cool
registry             <--  A local container registry, because why not
artifactory/nexus    <--  Simulate have a local artifact server
Consul1 and Consul 2 <--  These will the HA setup for consul
Vault0 and Vault1    <--  These will be the HA Vault pair
Kubernetes           <--  A simple Kubernetes setup 
HA Proxy / Ngnix     <--  Setup as a load balancer. This will front end consul/vault and kubernetes
-->

## Vagrant Version and Plugins
Vagrant 2.2.5  

__Plugins__
* vagrant-env (0.0.3, global)
* vagrant-vbguest (0.18.0, global)

## Environment Variables

| Environment Variable      | Description   |
| ------------------------- | ------------- |
| VAGRANT_SSH_KEY_LOCATION  | Directory that contains the SSH Keys that the virtual machine will access on the local machine. |
| VAGRANT_LOCAL_MOUNT       | Directory that the virual will mount |
| VAGRANT_DATA_MOUNT        | x                                    |