variable "main_region" {
  type    = string
  default = "us-east-1"
}

variable "main_project_name" {
  type = string
}

variable "main_node_list" {
  type = set(string)
}

variable "main_master_list" {
  type = set(string)
}

variable "main_instance_type" {
  type = string
}