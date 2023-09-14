resource "aws_route_table_association" "terraform_rt_association_pub_01" {
  subnet_id      = aws_subnet.terraform_public_subnet_01.id
  route_table_id = aws_route_table.terraform_rt_pub_01.id

}

resource "aws_route_table_association" "terraform_rt_association_pub_02" {
  subnet_id      = aws_subnet.terraform_public_subnet_02.id
  route_table_id = aws_route_table.terraform_rt_pub_01.id

}


resource "aws_route_table_association" "terraform_rt_association_pri_01" {
  subnet_id      = aws_subnet.terraform_private_subnet_01.id
  route_table_id = aws_route_table.terraform_rt_pri_01.id

}


resource "aws_route_table_association" "terraform_rt_association_pri_02" {
  subnet_id      = aws_subnet.terraform_private_subnet_02.id
  route_table_id = aws_route_table.terraform_rt_pri_02.id

}

