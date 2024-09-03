# Retrieve info about AWS SSO/IAM Identity Center configuration
data "aws_ssoadmin_instances" "example" {}

resource "aws_identitystore_user" "sso_user" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.example.identity_store_ids)[0]

  display_name = "${var.first_name} ${var.last_name}"
  user_name    = var.email

  name {
    given_name  = var.first_name
    family_name = var.last_name
  }

  emails {
    value = var.email
  }
}

variable "first_name" {
  type = string
}

variable "last_name" {
  type = string
}

variable "email" {
  type = string
}