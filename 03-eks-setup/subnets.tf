
resource "aws_subnet" "terraform_public_subnet" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  count                   = length(var.public_subnet_cidrs)
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true # required for EKS 

  tags = {
    "Name"                                      = "TF Public Subnet ${count.index + 1}"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned" # the name of  cluster is important here. 
    "kubernetes.io/role/elb"                    = "1"
  }
}
/*
resource "aws_subnet" "terraform_private_subnet" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    "Name"                                      = "TF Private Subnet ${count.index + 1}"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}
*/
