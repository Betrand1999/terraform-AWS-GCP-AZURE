
module "ec2_module" {
  source           = "../ec2-child-module"
  my_ami           = var.my_ami
  my_instance_type = var.my_instance_type
  my_region        = var.my_region
  my_tag           = var.my_tag


}
output "ec_module_output" {
  value = module.ec2_module.ec2_module_output
}
