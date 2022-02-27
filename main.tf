provider "aws" {
  region = var.main_region
}

module "nodes" {
  source        = "./modules/nodes"
  region        = var.main_region
  instance_type = var.main_instance_type
  instance_list = var.main_instance_list
  is_terraform  = true
  project_name  = var.main_project_name
  project_phase = var.main_project_phase
  key_name      = join(" - ", [var.main_project_name, var.main_project_phase])

}