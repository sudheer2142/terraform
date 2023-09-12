module "ec2"{
    source="../terraform-modules-ec2"
    ami_id="ami-03265a0778a880afb"
    instance_type="t2.micro"
}