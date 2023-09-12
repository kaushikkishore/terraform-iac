
# Create a security group
resource "aws_security_group" "terraform_security_group" {
  name_prefix = "terraform-security-group-"
  description = "My terraform Security Group"
  vpc_id      = aws_vpc.terraformvpc.id

  # Define ingress (inbound) rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH access from anywhere (for demonstration purposes)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP access from anywhere (for demonstration purposes)
  }

  # You can add more ingress rules as needed
  tags = {
    Name = "terraform-security-group"
  }
}
