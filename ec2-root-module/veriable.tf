
variable "my_instance_type" {
  type        = string
  default     = "value"
  description = "value"

}

variable "my_ami" {
  type        = string
  default     = "value"
  description = "value"

}

variable "my_tag" {
  type = map(string)
  default = {
    "Name" = "value"

  }


}

variable "my_region" {
  type    = string
  default = "value"



}
