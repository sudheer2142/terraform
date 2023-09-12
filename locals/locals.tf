locals  {
    ami_id = "ami-03265a0778a880afb" 
    myfile=file("${path.module}/mykey.pub")
    instance_type = var.isPROD ? "t3.medium" : "t2.micro"

}