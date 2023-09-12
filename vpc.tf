resource "aws_vpc" "terraformvpc" {
  cidr_block           = "10.0.0.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "terraformvpc"
  }
}


# Create multiple subnets within the VPC
resource "aws_subnet" "terraform-subnet" {
  count                   = 3 # Change this to the number of subnets you want
  vpc_id                  = aws_vpc.terraformvpc.id
  cidr_block              = element(["10.0.0.0/26", "10.0.0.64/26", "10.0.0.128/26"], count.index)
  availability_zone       = element(["ap-south-1a", "ap-south-1b", "ap-south-1c"], count.index) # Adjust AZs as needed
  map_public_ip_on_launch = true
  tags = {
    Name = "terraform-subnet-${count.index}"
  }
}


