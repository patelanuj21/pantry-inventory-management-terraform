provider "aws" {
  region = var.region
}

data "aws_ami" "this" {
  most_recent = true
  owners      = ["679593333241"]

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS ENA*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = var.instance_list

  name = "instance-${each.key}"


  ami           = data.aws_ami.this.id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = <<-EOF
      #!/bin/sh
      sudo yum update -y
      sudo yum upgrade -y
      sudo useradd ansible
      EOF


  tags = {
    Terraform = var.is_terraform
    Name      = join("_", ["TF",var.project_name, var.project_phase, title("${each.key}")])
    Phase     = var.project_phase
  }
}