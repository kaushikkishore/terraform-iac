resource "aws_nat_gateway" "terraform_gw_01" {
  allocation_id = aws_eip.terraform_eip_01.id
  subnet_id     = aws_subnet.terraform_public_subnet_01.id
  tags = {
    "Name" = "terraform_gw_01"
  }
}


resource "aws_nat_gateway" "terraform_gw_02" {
  allocation_id = aws_eip.terraform_eip_02.id
  subnet_id     = aws_subnet.terraform_public_subnet_02.id
  tags = {
    "Name" = "terraform_gw_02"
  }
}
