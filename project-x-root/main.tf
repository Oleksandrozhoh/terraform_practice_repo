# Define a list of users

# Create modules using for_each
module "users" {
  source     = "../iam-identity-center-users"
  for_each   = { for user in csvdecode(file("24a_users.csv")) : "${user.firstname}_${user.lastname}" => user }

  first_name = each.value.firstname
  last_name  = each.value.lastname
  email      = each.value.email
}
