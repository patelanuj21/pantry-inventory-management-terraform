# Pantry Inventory Management System - Terraform
This is a Terraform Project that can be used to implement the infrastructire for the Pantry Inventory Management System project.

The goal of this project is to deploy a master (Ansible & Kubernetes) host and their nodes using Terraform for managing the Infrastructure as Code.

## Requirements
---
This project assumes the follwoing:
1. You have the `aws-cli` command setup and configured with access key and secret key.
1. You have the required permissions to create several EC2 instances and security groups
1. You have existing Key Pairs with the specific naming format  
**<main_project_name_variable> - <workspace_name>**  
For example, if the project name is `Pantry` and the workspace name is `staging`, the project assumes you have a Key Pair created with the name:  
**Pantry - Staging**

## Setup
---
1. Initialize the terraform  
`terraform init`

1. Creating Terraform workspaces  
`terraform workspace new production`  
`terraform workspace new staging`  
`terraform workspace new development`  

1. Switch to the appropriate workspace  
Example:
`terraform workspace select development` 

1. Use a variable file that best describes the workspace and modify the variables as required.
1. Plan the terraform deploy  
Example:
`terraform plan -var-file=development.tfvars` 
1. Verify and apply the change  
Example:
`terraform apply -var-file=development.tfvars` 
1. Repeat steps 3 - 6 for each workspace and its corresponding `-var-file` parameter

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_master"></a> [master](#module\_master) | ./modules/master | n/a |
| <a name="module_nodes"></a> [nodes](#module\_nodes) | ./modules/nodes | n/a |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_main_instance_type"></a> [main\_instance\_type](#input\_main\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_main_master_list"></a> [main\_master\_list](#input\_main\_master\_list) | n/a | `set(string)` | n/a | yes |
| <a name="input_main_node_list"></a> [main\_node\_list](#input\_main\_node\_list) | n/a | `set(string)` | n/a | yes |
| <a name="input_main_project_name"></a> [main\_project\_name](#input\_main\_project\_name) | n/a | `string` | n/a | yes |
| <a name="input_main_region"></a> [main\_region](#input\_main\_region) | n/a | `string` | `"us-east-1"` | no |
