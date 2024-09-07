module "users" {
  source = "./users"
}

module "groups" {
  source            = "./groups"
  identity_store_id = module.users.identity_store_id
  member_ids        = module.users.member_ids
}