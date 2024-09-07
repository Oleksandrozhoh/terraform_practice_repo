resource "aws_identitystore_group" "group" {
  display_name      = "test_group"
  description       = "Test"
  identity_store_id = var.identity_store_id
}

variable "identity_store_id" {
  type = string
}

variable "member_ids" {
  type = map(string)
}

resource "aws_identitystore_group_membership" "group_membership" {
  identity_store_id = var.identity_store_id
  group_id          = aws_identitystore_group.group.group_id

  for_each = var.member_ids

  member_id         = each.value
}
