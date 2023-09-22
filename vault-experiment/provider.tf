terraform {
  required_version = "1.5.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.2"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.20.1"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}

provider "vault" {
  # Configuration options

}
