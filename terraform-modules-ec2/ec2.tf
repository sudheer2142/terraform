resource "aws_instance" "roboshopec2"{
    ami=var.ami_id
    instance_type=var.instance_type
}