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
  region = "us-east-1"
}


terraform {
  backend "s3" {
    region         = "us-east-1"
    bucket         = "betrandterraformstatebucketttt"
    key            = "statefile"
    dynamodb_table = "dynamodb_table"

  }
}



resource "aws_instance" "vm_1" {
  ami           = each.value
  instance_type = "t2.micro"

  for_each = {
    "vm_1" = "ami-0453ec754f44f9a4a"
    "vm_2" = "ami-0453ec754f44f9a4a"

  }
  tags = {
    Name = each.key
  }
  depends_on = [null_resource.my_null_resource]
}




output "instance_info" {
  value = aws_instance.vm_1["vm_1"].ami


}

resource "null_resource" "my_null_resource" {
  provisioner "local-exec" {
    command = "echo sucessully deploy"
  }

}
