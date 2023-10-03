
# locals {
#   suffix = formatdate("YYYY-MMM-DD-hh-mm", timeadd(timestamp(), "4.5h"))
# }

# # Create an S3 bucket for storing Terraform state files.
# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "state-bucket-${local.suffix}" # Replace with your desired bucket name
#   acl    = "private"                # Adjust ACL as needed
# }

# # Create a DynamoDB table for Terraform state locking.
# resource "aws_dynamodb_table" "terraform_lock" {
#   name           = "terraform-lock-table-${local.suffix}"
#   billing_mode   = "PAY_PER_REQUEST"
#   hash_key       = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

# # Configure the backend for Terraform to use S3 and DynamoDB.
# terraform {
#   backend "s3" {
#     bucket         = aws_s3_bucket.terraform_state.bucket
#     key            = "state/terraform.tfstate"
#     encrypt        = true
#     dynamodb_table = aws_dynamodb_table.terraform_lock.name
#   }
# }
