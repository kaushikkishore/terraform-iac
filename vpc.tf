resource "aws_vpc" "terraformvpc" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "terraformvpc"
  }
}

# Create multiple subnets within the VPC
resource "aws_subnet" "terraform_subnet" {
  vpc_id     = aws_vpc.terraformvpc.id
  cidr_block = "10.1.0.0/24"
  tags = {
    Name = "terraform-subnet"
  }
}

