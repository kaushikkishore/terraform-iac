#!/bin/sh

# installation process AWS Linux 2
echo "Installing Vault on AWS Linux 2"
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install vault


# create a folder for vault data
echo "Creating a folder for vault data"
mkdir -p ./vault/data

# start vault
echo "Starting Vault"
nohup sh -c "vault server -config=config.hcl > vault.log 2>&1" > nohup.log &

export VAULT_ADDR=http://127.0.0.1:8200

# init vault
echo "Initializing Vault"
sudo vault operator init -address=http://127.0.0.1:8200 > vault_init.txt

echo "Printing Vault Initialization"
cat vault_init.txt

# unseal the vault for now. 
echo "Unsealing Vault 01"
vault operator unseal $(grep 'Key 1:' vault_init.txt | awk '{print $NF}')

echo "Unsealing Vault 02"
vault operator unseal $(grep 'Key 2:' vault_init.txt | awk '{print $NF}')

echo "Unsealing Vault 03"
vault operator unseal $(grep 'Key 3:' vault_init.txt | awk '{print $NF}')

echo "Unsealing Vault done && login started"
vault login $(grep 'Initial Root Token:' vault_init.txt | awk '{print $NF}')

echo "Login done && exporting token"
export VAULT_TOKEN=$(grep 'Initial Root Token:' vault_init.txt | awk '{print $NF}')

echo "finished all scripts"
exit 0