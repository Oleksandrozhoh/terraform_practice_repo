terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # backend "s3" {
  #   bucket = "312-main-account-state-bucket"
  #   key    = "24a/terraform.tfstate"
  #   region = "us-east-2"
  #   dynamodb_table = "24a_state_lock"
  # }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "null_resource" "for_each1" {
  for_each = {for each in csvdecode(file("test.csv")) : "${each.first_name}_${each.last_name}" => each }

  triggers = {
    always_run = "${timestamp()}"  # Forces recreation on each apply
  }

  provisioner "local-exec" {
    command = "echo 'The key is ${each.key}' && echo 'The value is ${each.value.email}'"
  }
}

