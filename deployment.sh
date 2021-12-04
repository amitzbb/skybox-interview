#!/bin/bash
git clone https://github.com/amitzbb/skybox-interview.git
cd ./skybox-interview
terraform init -input=false
terraform apply -auto-approve