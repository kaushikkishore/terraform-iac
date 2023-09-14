# place 1 nat gateway to each az to make it highly available 
resource "aws_eip" "terraform_eip_01" {
  # this must be already created
  depends_on = [aws_internet_gateway.terraform_igw]


  tags = {
    "Name" : "terraform_eip_01"
  }
}

resource "aws_eip" "terraform_eip_02" {
  # this must be already created
  depends_on = [aws_internet_gateway.terraform_igw]


  tags = {
    "Name" : "terraform_eip_02"
  }
}
