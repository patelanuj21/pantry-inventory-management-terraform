variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "node_list" {
  type = set(string)
}

variable "is_terraform" {
  type = bool
}

variable "project_name" {
  type = string
}

variable "project_phase" {
  type = string
}

variable "key_name" {
  type = string
}