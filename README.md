
# Skybox terrafrom exercise .
## Prerequisites :
* docker
* terraform

### to install terraform on centos:

```bash
 sudo yum install -y yum-utils
 sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
 sudo yum -y install terraform
 terraform -help
```

#### clone the repository to your linux vm and move to the relvant directory 
```bash
 run the following commands
 terraform init
 terrafrom apply --> enter yes
```
#### make sure it works as expected
make sure your haproxy is up running using docker ps, open your chrome browser and enter the vm ip.
you will get hello world with the hostname of one of the 2 webservers refresh the page to see that roundrobin
engine is working.

##### haproxy dashboard http://hostip:/haproxy?stats admin:admin

###### you can also copy deployment.sh run chmod +x deployment.sh and excute the script ./deployment.sh this will clone the repo and run terraform
