variable "main_region" {
  type    = string
  default = "us-east-1"
}

variable "main_project_name" {
}

variable "main_project_phase" {
  description = "Project Phase. Example - Development / Staging / Production"
}

variable "main_node_list" {
  type = set(string)
}

variable "main_master_list" {
  type = set(string)
}

variable "main_instance_type" {
}