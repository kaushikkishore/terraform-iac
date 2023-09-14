resource "aws_route_table" "terraform_rt_pub_01" {
  vpc_id = aws_vpc.terraform_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_igw.id
  }
  tags = {
    "Name" : "terraform_route_table_public_01"
  }
}


resource "aws_route_table" "terraform_rt_pri_01" {
  vpc_id = aws_vpc.terraform_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform_gw_01.id
  }
  tags = {
    "Name" : "terraform_route_table_private_01"
  }
}

resource "aws_route_table" "terraform_rt_pri_02" {
  vpc_id = aws_vpc.terraform_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.terraform_gw_02.id
  }
  tags = {
    "Name" : "terraform_route_table_private_02"
  }
}
