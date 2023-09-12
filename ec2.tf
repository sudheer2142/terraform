 #resource "aws_instance" "my-first-ec2" {
  #ami = "ami-0dcc1e21636832c5d"
 # instance_type = "t2.micro"
  
#}

resource "aws_instance" "my-first-ec2" {
  ami = var.ami_id
  instance_type = "t2.micro"
  security_groups= [aws_security_group.allow-all-new.name]
  
}