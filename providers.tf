terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
    alias   =   "east"
    region  =   "us-east-1"
}

provider "aws" {
    alias   =   "west"
    region  =   "us-west-1"
}