sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
terraform -help

docker build --pull --rm -f "load-balancing/app1/Dockerfile" -t skybox-app:latest "load-balancing/app1"
docker build --pull --rm -f "load-balancing/haproxy/Dockerfile" -t skybox-haproxy:latest "load-balancing/haproxy"