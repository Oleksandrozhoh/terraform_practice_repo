resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "reviews_app_data"
  engine               = "Postgres"
  engine_version       = "16.1"
  instance_class       = "db.t3.micro"
  backup_retention_period = 7
  identifier = "reviews-app-db"
  username             = "foo"
  parameter_group_name = "default.postgres16"
  skip_final_snapshot  = true
  manage_master_user_password = true
  vpc_security_group_ids = ["sg-075bc0d3223262002"]
}