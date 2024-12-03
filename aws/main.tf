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


locals {
  vm_names = ["DEV", "QA"]
}

resource "aws_instance" "vm_a" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = "t3.micro"
  count         = 1
  tags = {
    Name = local.vm_names[count.index]
  }

}






output "name" {
  value = {
    IP  = aws_instance.vm_a["0"].public_ip
    ARN = aws_instance.vm_a["0"].arn
    AMI = aws_instance.vm_a["0"].ami
  }
}

######
