terraform {
  backend "s3" {
    bucket         = "tf-state-mngmt"
    key            = "rds-setup/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}
