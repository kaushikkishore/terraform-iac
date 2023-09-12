resource "aws_vpc" "terraformvpc" {
  cidr_block           = "10.0.0.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "terraformvpc"
  }
}

resource "aws_subnet" "terraform-subnet-1" {
  vpc_id            = aws_vpc.terraformvpc.id
  cidr_block        = "10.0.0.0/26"
  availability_zone = "ap-south-1a" # Choose your desired availability zone
  # Other subnet configuration...
}

resource "aws_subnet" "terraform-subnet-2" {
  vpc_id            = aws_vpc.terraformvpc.id
  cidr_block        = "10.0.0.64/26"
  availability_zone = "ap-south-1b" # Choose another availability zone
  # Other subnet configuration...
}

resource "aws_subnet" "terraform-subnet-3" {
  vpc_id            = aws_vpc.terraformvpc.id
  cidr_block        = "10.0.0.128/26"
  availability_zone = "ap-south-1c" # Choose another availability zone
  # Other subnet configuration...
}

