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

  for_each = var.node_list

  name = "instance-${each.key}"


  ami                    = data.aws_ami.this.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.node_security_group.id]


  user_data = <<-EOF
      #!/bin/bash -xe
      exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
      sudo yum update -y
      EOF


  tags = {
    Terraform = var.is_terraform
    Name      = join("_", ["TF", var.project_name, var.project_phase, title("${each.key}")])
    Phase     = var.project_phase
  }
}

resource "aws_security_group" "node_security_group" {
  name        = join(" - ", ["TF", var.project_name, var.project_phase, "Node"])
  description = "Security Group for Master servers on ${var.project_phase} environments"

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ingress {
  #   from_port   = 5000
  #   protocol    = "TCP"
  #   to_port     = 5000
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Terraform = var.is_terraform
    Name      = join("_", ["TF", var.project_name, var.project_phase, "Node", "SecurityGroup"])
    Phase     = var.project_phase
  }
}