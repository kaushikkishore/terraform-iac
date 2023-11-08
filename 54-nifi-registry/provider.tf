terraform {
  required_version = "1.6.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.2"
    }

  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}
