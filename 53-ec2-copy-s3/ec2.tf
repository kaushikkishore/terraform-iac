
locals {
  ec2InstanceName = formatdate("YYYY-MMM-DD-hh-mm", timeadd(timestamp(), "4.5h"))
}
resource "aws_instance" "myec2" {
  ami           = "ami-067c21fb1979f0b27"
  instance_type = "t2.micro"
  key_name      = "astuto-mac"
  tags = {
    "Name" = "terraform-ec2-instance-${local.ec2InstanceName}"
  }

  # SSH connection
  connection {
    type        = "ssh"
    user        = "ec2-user"                         # Replace with the appropriate user for your AMI
    private_key = file("~/Documents/astuto-mac.pem") # Replace with the path to your private key file
    host        = aws_instance.myec2.public_ip
  }

  # Remote-exec provisioner to run commands on the EC2 instance
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install python3 -y",
      "sudo yum install python3-pip -y",
      "pip3 install virtualenv",

    ]
  }
}

output "publicIP" {
  value = aws_instance.myec2.public_ip
}

output "availability_zone" {
  value = aws_instance.myec2.availability_zone

}

output "public_dns" {
  value = aws_instance.myec2.public_dns
}
output "ssh_command" {
  value = "ssh -i ~/Documents/astuto-mac.pem ec2-user@${aws_instance.myec2.public_dns}"
}

