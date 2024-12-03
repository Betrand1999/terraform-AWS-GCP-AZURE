terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.78.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "betrandterraformstatebucketttt"
    region         = "us-east-1"
    key            = "terraform_tfstate_file_new"
    dynamodb_table = "dynamodb_table"
  }
}

module "ec2_module" {
  source           = "../ec2-child-module"
  my_ami           = var.my_ami
  my_instance_type = var.my_instance_type
  my_tag           = var.my_tag
}
