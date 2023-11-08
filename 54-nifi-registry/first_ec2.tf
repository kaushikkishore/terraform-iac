
locals {
  ec2InstanceName = formatdate("YYYY-MMM-DD-hh-mm", timeadd(timestamp(), "4.5h"))
}
resource "aws_instance" "nifi-registry" {
  ami           = "ami-02e94b011299ef128"
  instance_type = "t2.micro"
  key_name      = "astuto-mac"
  tags = {
    "Name" = "terraform-ec2-instance-${local.ec2InstanceName}"
  }

  # # SSH connection
  connection {
    type        = "ssh"
    user        = "ec2-user"                         # Replace with the appropriate user for your AMI
    private_key = file("~/Documents/astuto-mac.pem") # Replace with the path to your private key file
    host        = self.public_ip
  }

  # Remote-exec provisioner to run commands on the EC2 instance

  # provisioner "file" {
  #   source      = "script.sh"                # Replace with the path to your local file
  #   destination = "/home/ec2-user/script.sh" # Specify the destination path on the EC2 instance
  # }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install java-17-amazon-corretto-devel -y",
      "echo 'export JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto.x86_64' >> /home/ec2-user/.bashrc",
      "source /home/ec2-user/.bashrc",
      "echo 'Java installed'",

      "curl -o nifi-registry-1.23.2-bin.zip https://dlcdn.apache.org/nifi/1.23.2/nifi-registry-1.23.2-bin.zip",
      "unzip nifi-registry-1.23.2-bin.zip",
      "sudo cp -r nifi-registry-1.23.2 /opt/",
      "sudo chown -R ec2-user:ec2-user /opt/nifi-registry-1.23.2",

      "echo -e '\n' >> /opt/nifi-registry-1.23.2/bin/nifi-registry-env.sh",
      "echo -e '# adding java home' >> /opt/nifi-registry-1.23.2/bin/nifi-registry-env.sh",
      "echo -e 'export JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto.x86_64' >> /opt/nifi-registry-1.23.2/bin/nifi-registry-env.sh",


      "/opt/nifi-registry-1.23.2/bin/nifi-registry.sh install",

      "echo 'Nifi-registry installed'",

      "/opt/nifi-registry-1.23.2/bin/nifi-registry.sh start",
      "sleep 20",
      "/opt/nifi-registry-1.23.2/bin/nifi-registry.sh status",
      "sleep 10",
      "/opt/nifi-registry-1.23.2/bin/nifi-registry.sh start",
      "echo 'Finished setting up the apache nifi registry'"
    ]
  }

}

output "publicIP" {
  value = aws_instance.nifi-registry.public_ip
}

output "availability_zone" {
  value = aws_instance.nifi-registry.availability_zone

}

output "public_dns" {
  value = aws_instance.nifi-registry.public_dns
}
output "ssh_command" {
  value = "ssh -i ~/Documents/astuto-mac.pem ec2-user@${aws_instance.nifi-registry.public_dns}"
}

