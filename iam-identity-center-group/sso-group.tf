resource "aws_identitystore_group" "sso_group" {
  display_name      = var.group_name
  description       = var.group_description
  identity_store_id = var.sso_id
}

variable "group_name" {
  type = string
}

variable "group_description" {
  type = string
}

variable "sso_id" {
  type = string
}