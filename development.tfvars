main_region   = "us-west-1"
project_name  = "Pantry"
project_phase = "Development"
instance_list = ["master", "node1", "node2"]
key_name      = join("-", [var.project_name])
