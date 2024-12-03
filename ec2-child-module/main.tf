
resource "aws_instance" "vm_a" {
  ami           = var.my_ami           # "ami-0453ec754f44f9a4a"
  instance_type = var.my_instance_type # "t2.micro"
  tags          = var.my_tag
}


