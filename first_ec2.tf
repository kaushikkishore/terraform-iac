provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "myec2" {
  ami           = "ami-02bb7d8191b50f4bb"
  instance_type = "t2.micro"
  # tags = {
  #   "Name" = "terraform-ec2-instance"
  # }
}
