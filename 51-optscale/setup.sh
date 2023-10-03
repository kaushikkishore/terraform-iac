#!/bin/bash

# install git python venv sshpass
sudo apt update ; sudo apt install git python3-venv python3-dev sshpass

git clone https://github.com/hystax/optscale.git

cd optscale/optscale-deploy

# start application 
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt