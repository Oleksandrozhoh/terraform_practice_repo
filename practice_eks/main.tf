module "eks" {
  source = "./eks_module"
  subnet_ids = var.subnet_ids
  cluster_name = var.cluster_name
  cluster_role_name = var.cluster_role_name
  node_group_name = var.node_group_name
  node_group_role_name = var.node_group_role_name
  instance_types = var.instance_types
}

variable "subnet_ids" {
  type = list(string)
}

variable "cluster_name" {
  type = string
}

variable "cluster_role_name" {
  type = string
}

variable "node_group_role_name" {
  type = string
}

variable "node_group_name" {
  type = string
}

variable "instance_types" {
  type = list(string)
}