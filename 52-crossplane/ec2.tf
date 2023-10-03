
locals {
  ec2InstanceName = formatdate("YYYY-MMM-DD-hh-mm", timeadd(timestamp(), "4.5h"))
}

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = "t3.micro"
  key_name      = "astuto-mac"
  root_block_device {
    volume_type = "gp3"
    volume_size = 20
  }
  tags = {
    "Name" = "terraform-ec2-instance-${local.ec2InstanceName}"
  }

  # SSH connection
  # connection {
  #   type        = "ssh"
  #   user        = "${var.user}"                       # Replace with the appropriate user for your AMI
  #   private_key = file("~/Documents/astuto-mac.pem") # Replace with the path to your private key file
  #   host        = aws_instance.myec2.public_ip
  # }

  # provisioner "file" {
  #   source      = "setup.sh"                # Replace with the path to your local file
  #   destination = "/home/${var.user}/setup.sh" # Specify the destination path on the EC2 instance
  # }


  # Remote-exec provisioner to run commands on the EC2 instance
  # provisioner "remote-exec" {
  #   inline = [
  #     "chmod +x /home/${var.user}/setup.sh",
  #     "sudo /home/${var.user}/setup.sh",
  #     "echo 'Configured all needfuls'",
  #   ]
  # }
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
  value = "ssh -i ~/Documents/astuto-mac.pem ${var.user}@${aws_instance.myec2.public_dns}"
}

