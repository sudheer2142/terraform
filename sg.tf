resource "aws_security_group" "allow-all-new" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic"


  ingress {
    description      = "allowing all ports"
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = var.sg_cidr
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # means allowing all
    cidr_blocks      = var.sg_cidr
   
  }

  tags = {
    Name = "allow-all-new"
  }
}