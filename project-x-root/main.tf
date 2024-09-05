# Retrieve info about AWS SSO/IAM Identity Center configuration
data "aws_ssoadmin_instances" "example" {}

locals {
  local_sso_id = tolist(data.aws_ssoadmin_instances.example.identity_store_ids)[0]
}

# Create modules using for_each
module "users" {
  source     = "../iam-identity-center-users"
  csv_with_users = "24a_users.csv"
  sso_id = local.local_sso_id
}

module "group_24a" {
  source = "../iam-identity-center-group"
  group_name = "DevOps-24a"
  group_description = "24A Batch Group"
  sso_id = local.local_sso_id
  # users to add to the group - next class!
}
