variable "my_ami" {
  type        = string
  default     = "value"
  description = "value"

}

variable "my_instance_type" {
  type        = string
  default     = "value"
  description = "value"

}

variable "my_tag" {
  type = map(string)
  default = {
    "name" = "value"
  }
  description = "value"

}
