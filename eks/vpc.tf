resource "aws_vpc" "terraform_vpc" {
  cidr_block = "10.0.0.0/16"

  # make your instance shared on host 
  instance_tenancy = "default"

  # required for EKS enable dns support
  enable_dns_support = true

  # required for EKS enable dns hostnames
  enable_dns_hostnames = true

  # Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC.
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "terraform_vpc"
  }
}

output "vpc_id" {
  value       = aws_vpc.terraform_vpc.id
  description = "Terraform VPC ID"
  sensitive   = false
}
