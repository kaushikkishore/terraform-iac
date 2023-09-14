# public subnet 01
resource "aws_subnet" "terraform_public_subnet_01" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "10.0.0.0/18"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true # required for EKS 

  tags = {
    "Name"                      = "TF Public Subnet 1 ap-south-1a"
    "kubernetes.io/cluster/eks" = "shared" # the name of  cluster is important here. 
    "kubernetes.io/role/elb"    = 1
  }
}

# public subnet 02
resource "aws_subnet" "terraform_public_subnet_02" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "10.0.64.0/18"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true # required for EKS 

  tags = {
    "Name"                            = "TF Public Subnet 2 ap-south-1b"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

# private subnet 01
resource "aws_subnet" "terraform_private_subnet_01" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "10.0.128.0/18"
  availability_zone = "ap-south-1a"

  tags = {
    "Name"                            = "TF Private Subnet ap-south-1a"
    "kubernetes.io/cluster/eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

# private subnet 02
resource "aws_subnet" "terraform_private_subnet_02" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = "10.0.192.0/18"
  availability_zone = "ap-south-1b"

  tags = {
    "Name"                      = "TF Private Subnet ap-south-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}
