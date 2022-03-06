provider "aws" {
  region = var.main_region
}

module "nodes" {
  source        = "./modules/nodes"
  region        = var.main_region
  instance_type = var.main_instance_type
  node_list     = var.main_node_list
  is_terraform  = true
  project_name  = var.main_project_name
  project_phase = local.main_project_phase
  key_name      = join(" - ", [var.main_project_name, local.main_project_phase])

}

module "master" {
  source        = "./modules/master"
  region        = var.main_region
  instance_type = var.main_instance_type
  master_list   = var.main_master_list
  is_terraform  = true
  project_name  = var.main_project_name
  project_phase = local.main_project_phase
  key_name      = join(" - ", [var.main_project_name, local.main_project_phase])

}