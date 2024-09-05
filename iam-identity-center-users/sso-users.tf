resource "aws_identitystore_user" "sso_user" {
  identity_store_id = var.sso_id
  for_each   = { for user in csvdecode(file(var.csv_with_users)) : "${user.firstname}_${user.lastname}" => user }

  display_name = "${each.value.firstname} ${each.value.lastname}"
  user_name    = each.value.email

  name {
    given_name  = each.value.firstname
    family_name = each.value.lastname
  }

  emails {
    value = each.value.email
  }
}

variable "sso_id" {
  type = string
}

variable "csv_with_users" {
  type = string
}