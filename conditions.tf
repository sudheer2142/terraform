resource "aws_instance" " my_second_ec2" {
    ami= var.ami_id
    instance_type = var.instance_name == "mongodb" ? "t3.medium" : "t2.micro"
}


