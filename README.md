# laravel-app-with-ansible  
## Deploying a backend laravel app using Ansible configuration ##  

This is an ansible playbook that deploys a backend laravel application for the Debian 11 distro  

Details:  
This directory contains the following:  

ansible.cfg file  
host_vars directory: lists playbook's variables  
inventory file  
roles directory: containing ansible roles  
scripts directory: containing a bash script file that installs & configures postgresql into the server. This script is run by playbook.yml  
playbook.yml: this is the main file that runs all roles and bash scripts. Run this file to deploy the application on Debian 11  
