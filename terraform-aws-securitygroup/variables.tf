variable "project_name" {
  
}
variable "sg_name" {
  
}

variable "sg_description" {
  default = ""
}

variable "vpc_id" {
  
}

variable "sg_ingress_rules" {
  default = []
}

variable "common_tags" {
  default = {}
}

variable "sg_tags" {
  default = {}
}