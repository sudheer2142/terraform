module "ec2_instance" {
  for_each = var.instances
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops_ami.id
  instance_type = each.value
  vpc_security_group_ids = [local.allow_all_security_group_id]
  subnet_id = each.key == "Web" ? local.public_subnet_ids[0] : local.private_subnet_ids[0] # public subnet in 1a az
  tags = merge(
    {
        Name = each.key
    },
    var.common_tags
  )
}

module "ec2_ansible" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.devops_ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [local.allow_all_security_group_id]
  subnet_id = local.public_subnet_ids[0] # public subnet in 1a az
  user_data = file("roboshop-ansible.sh")
  tags = merge(
    {
        Name = "Ansible"
    },
    var.common_tags
  )
}
