#!/bin/bash

# ---------------------------------------
# DOCKER
# ---------------------------------------
# sudo yum install docker -y
# sudo usermod -a -G docker ec2-user
# id ec2-user
# newgrp docker

# sudo systemctl enable docker.service
# sudo systemctl start docker.service
# # systemctl status docker.service
# echo "docker installed" >> log.txt

# ---------------------------------------
# MINIKUBE
# ---------------------------------------
# curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
# sudo install minikube-linux-amd64 /usr/local/bin/minikube
# minikube start
# echo "Minikube started" >> log.txt

# ---------------------------------------
# microk8s
# ---------------------------------------
sudo apt update -y
sudo apt install snapd -y
sudo snap install microk8s --classic
sudo usermod -a -G microk8s ubuntu
sudo microk8s enable dns
echo "microk8s installed" >> log.txt

# ---------------------------------------
# KUBECTL
# ---------------------------------------
sudo snap install kubectl --classic
# add to existing kubectl
sudo microk8s kubectl config view --raw > $HOME/.kube/config
# remove permissions
sudo chmod go-wr ~/.kube/config

# ---------------------------------------
# HELM
# ---------------------------------------
sudo snap install helm --classic

# ---------------------------------------
# CROSSPLANE
# ---------------------------------------
mkdir crossplane
cd crossplane 
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update
helm install crossplane --namespace crossplane-system --create-namespace crossplane-stable/crossplane 

