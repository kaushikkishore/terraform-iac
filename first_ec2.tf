
resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.terraform-subnet-1.id
  vpc_security_group_ids = [aws_security_group.terraform_security_group.id]

  # security_groups = [aws_security_group.terraform_security_group.name]
  tags = {
    "Name" = "terraform-ec2-instance"
  }
}
