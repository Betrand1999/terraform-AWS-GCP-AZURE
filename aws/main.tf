resource "aws_instance" "vm_a" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
  tags = {
    Name = "dev"
  }

}
