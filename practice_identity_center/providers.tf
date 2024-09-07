terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "remote-terraform-backend-oleksandr"
    key            = "sso_practice/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
