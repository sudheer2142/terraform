module "allow_all_sg" {
  source = "../terraform-aws-securitygroup"
  project_name = var.project_name
  sg_name = "allow-all"
  sg_description = "Allowing all ports from internet"
  sg_ingress_rules = var.sg_ingress_rules
  vpc_id = local.vpc_id
  common_tags = var.common_tags
}