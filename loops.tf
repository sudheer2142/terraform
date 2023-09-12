
# this example contains loops and conditinon and the cration of routes53 
resource "aws_instance" " my_second_ec3" {
    count=10 
    ami= var.ami_id
    instance_type =var.instance_name_list[count.index] == "mongodb"  || var.instance_name_list[count.index] == "mysql" ? "t3.medium" : "t2.micro"
    tags{
        Name = var.instance_name_list[count.index]
        #in the above loop it will fetch form the index based name from the instance_name_list 
    }
}

# here we are going to create route 53 records for the list of insatance for the loop based
resource "aws_route53_record" "record" {
  count =10
  zone_id = var.my_zone_id
  name    = "${var.instance_name_list[count.index]}.${var.my_domain}" # interpolation
  type    = "A"
  ttl     = 1
  records = [aws_instance.conditions[count.index].private_ip]
}