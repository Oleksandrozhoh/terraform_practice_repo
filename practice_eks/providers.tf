terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "remote-terraform-backend-oleksandr"
    key    = "24a/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "24a_state_lock"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}