#!/bin/bash

sudo yum install openssl
sudo curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh
sudo chmod 700 get_helm.sh
sudo ./get_helm.sh

helm version --short | cut -d + -f 1

