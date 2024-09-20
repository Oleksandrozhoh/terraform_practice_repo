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
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow PostgreSQL traffic to RDS"
  vpc_id      = data.aws_vpc.default.id  # Use the correct VPC ID

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = ["sg-075bc0d3223262002"]  # The EKS security group ID
  }
}