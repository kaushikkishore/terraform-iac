
resource "aws_instance" "myec2" {
  ami                    = var.ami
  instance_type          = "t3.micro"
  count                  = 3
  subnet_id              = element(aws_subnet.terraform-subnet[*].id, count.index)
  vpc_security_group_ids = [aws_security_group.terraform_security_group.id]
  tags = {
    "Name" = "terraform-ec2-instance-${count.index}"
  }
}
