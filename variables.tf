variable "ami_id" {
    type = string
    default = "ami-03265a0778a880afb" 
}

variable "sg_cidr" {
    type = list
    default = ["0.0.0.0/0"] 

}

variable "sg_name" {
    default="allow-all-new"
}

variable "instance_name"{

    default = "mongodb"
}

variable "instance_name_list"{
    type = list
    default = ["mongodb", "cart","user","cart","web","shipping","dispatch","payment","redis","rabbitmq"]
}

variable "my_zone_id"
{
    default="my hosting zone -repalce "
}

variable "my_domain"
{
    default="sudheerdevops.online"
}