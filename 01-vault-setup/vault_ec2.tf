resource "aws_instance" "myec2" {
  ami           = "ami-067c21fb1979f0b27"
  instance_type = "t2.micro"
  key_name      = "astuto-mac"
  tags = {
    "Name" = "terraform-ec2-instance-vault"
  }

  # SSH connection
  connection {
    type        = "ssh"
    user        = "ec2-user"                         # Replace with the appropriate user for your AMI
    private_key = file("~/Documents/astuto-mac.pem") # Replace with the path to your private key file
    host        = aws_instance.myec2.public_ip
  }

  provisioner "file" {
    source      = "config.hcl"                # Replace with the path to your local file
    destination = "/home/ec2-user/config.hcl" # Specify the destination path on the EC2 instance
  }
  provisioner "file" {
    source      = "script.sh"                # Replace with the path to your local file
    destination = "/home/ec2-user/script.sh" # Specify the destination path on the EC2 instance
  }

  # Remote-exec provisioner to run commands on the EC2 instance
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ec2-user/script.sh",
      "sudo /home/ec2-user/script.sh",
      "echo 'vault configured'",
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
