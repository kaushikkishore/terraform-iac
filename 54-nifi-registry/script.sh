#!/bin/bash
# sudo yum update -y
# sudo yum install java-17-amazon-corretto-devel -y
# echo 'export JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto.x86_64' >> ~/.bashrc
# source ~/.bashrc
# echo "Java installed"
curl -o nifi-registry-1.23.2-bin.zip https://dlcdn.apache.org/nifi/1.23.2/nifi-registry-1.23.2-bin.zip
unzip nifi-registry-1.23.2-bin.zip
sudo cp -r nifi-registry-1.23.2 /opt/
sudo chown -R ec2-user:ec2-user /opt/nifi-registry-1.23.2
sudo /opt/nifi-registry-1.23.2/bin/nifi-registry.sh install
sudo /opt/nifi-registry-1.23.2/bin/nifi-registry.sh start
echo 'Finished setting up'
echo 'Exit from su'