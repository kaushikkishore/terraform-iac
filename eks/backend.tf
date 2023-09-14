terraform {
  backend "s3" {
    bucket         = "tf-state-mngmt"
    key            = "eks/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}
