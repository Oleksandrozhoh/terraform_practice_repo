# Define a list of users
locals {
  engineers = [
    {
      first_name = "Alina"
      last_name  = "Stepanov"
      email      = "alina.ste@edu.312school.com"
    },
    {
      first_name = "Cristian"
      last_name  = "Butnaru"
      email      = "cristian.but@edu.312school.com"
    },
    {
      first_name = "William"
      last_name  = "Pulgarin"
      email      = "william.pul@edu.312school.com"
    }
  ]
}

# Create modules using for_each
module "users" {
  source     = "../iam-identity-center-users"
  for_each   = { for user in local.engineers : "${user.first_name}_${user.last_name}" => user }

  first_name = each.value.first_name
  last_name  = each.value.last_name
  email      = each.value.email
}
