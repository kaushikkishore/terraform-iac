#!/bin/sh

# install kubectl 
sudo curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.5/2023-09-14/bin/linux/amd64/kubectl
sudo curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.5/2023-09-14/bin/linux/amd64/kubectl.sha256
sha256sum -c kubectl.sha256
sudo chmod +x ./kubectl
sudo mkdir -p $HOME/bin 
sudo mv ./kubectl $HOME/bin/kubectl 
export PATH=$HOME/bin:$PATH
sudo echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
kubectl version --output=yaml




