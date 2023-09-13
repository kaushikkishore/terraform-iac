resource "aws_security_group" "terraform_security_group" {
  name_prefix = "terraform-security-group-"
  description = "My terraform Security Group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-security-group"
  }
}

resource "aws_instance" "myec2" {
  ami             = "ami-05552d2dcf89c9b24"
  security_groups = [aws_security_group.terraform_security_group.name]
  instance_type   = "t2.micro"
  tags = {
    "Name" = "terraform-ec2-instance"
  }
  key_name = "astuto-mac"

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("~/Documents/astuto-mac.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo systemctl start nginx",
    ]
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ip_address.txt"
  }

}
