resource "aws_vpc" "terraform_vpc" {
  cidr_block                       = "10.0.0.0/16"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  instance_tenancy                 = "default"
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name = "terraform-vpc"
  }
}

output "vpc_id" {
  value       = aws_vpc.terraform_vpc.id
  description = "Terraform VPC ID"
  sensitive   = false
}

