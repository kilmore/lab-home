# Local Lab  .... a.k.a. lab.local 
This repo is intended to funciton as a local lab. While AWS "can" be cheap somtimes you just need a local lab to test things out. This is an inprogress lab build out. USE AT YOUR OWN RISK. 

This vagrant file builds the "infrastructure" for you lab on your local workstation. Ansible is (or will be) used to configured all servers in the environment. The "idea" is to use this local lab as the test bed for development before pushing into my "home" lab environment. 

## Vagrant Version and Plugins
Vagrant 2.2.5  

__Plugins__
* vagrant-env (0.0.3, global)
* vagrant-vbguest (0.18.0, global)

## Environment Variables
| Environment Variables | Description |
| --- |--- |
| VAGRANT_ENABLE_LOCAL_SSH | Add the public key from the host workstaiton in the authorized keys for the guest operating systems. Makes it easier to access |
| VAGRANT_DATA_PATH  | Mount a local directory to all systems. Makes it easier to persist data between creation / destruction of the servers |
| VAGRANT_CODE_PATH  | Mount the code directory into the workstation created by Vagrant |

## Systems
| System      |  Description   | IP Address |
| --- |--- | --- |
| Workstation | Not all of us are lucky enought to work on a Mac or Linux workstation. This creates a linux workstation to run ansible and other tools from | 10.1.1.100 |

## Known Issues
