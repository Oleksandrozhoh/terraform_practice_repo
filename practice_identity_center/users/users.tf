data "aws_ssoadmin_instances" "identity_store" {}

resource "aws_identitystore_user" "users" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.identity_store.identity_store_ids)[0]

  for_each = { for value in csvdecode(file("users_to_create.csv")) : "${value.first_name}_${value.last_name}" =>  value }

  display_name = "${each.value.first_name} ${each.value.last_name}"
  user_name    = "${each.value.first_name}${each.value.last_name}"
  name {
    given_name  = each.value.first_name
    family_name = each.value.last_name
  }

  emails {
    value = each.value.email
  }
}

output "identity_store_id" {
  value = tolist(data.aws_ssoadmin_instances.identity_store.identity_store_ids)[0]
}

output "member_ids" {
  value = { for user in aws_identitystore_user.users : user.user_name => user.user_id }
}