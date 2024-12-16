terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.my_region
}

resource "aws_instance" "ec2" {
  ami                     = var.my_ami
  instance_type           = var.my_instance_type
  tags                    = var.my_tag
  disable_api_termination = true
  # lifecycle {
  #   prevent_destroy = true
  # }

}



