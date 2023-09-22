
resource "aws_instance" "myec2" {
  ami           = "ami-067c21fb1979f0b27"
  instance_type = "t2.micro"
  key_name      = "astuto-mac"
  tags = {
    "Name" = "terraform-ec2-instance-vault"
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

