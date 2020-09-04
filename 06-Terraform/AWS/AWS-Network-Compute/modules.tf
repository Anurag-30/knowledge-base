module "vpc" {
  source                    = "./modules/network"
  cidr_block                = var.cidr_block
  number_of_private_subnets = var.number_of_private_subnets
  number_of_public_subnets  = var.number_of_public_subnets
  env_name                  = var.env_name

}

module "loadbalancer" {
  depends_on                = [module.vpc]
  source                    = "./modules/load_balancer"
  public_subnets            = module.vpc.public_subnets
  alb_security_group        = module.vpc.security_group_elb
}

module "public_ec2" {
  source                   = "./modules/public_ec2_instances"
  aws_security             = [module.vpc.security_groups_id]
  public_subnets           = module.vpc.public_subnets
  depends_on               = [module.vpc]


}


module "private_ec2" {
  source                    = "./modules/private_ec2_instances"
  private_subnets           =  module.vpc.private_subnets
  aws_security              = [module.vpc.security_groups_id]
  public_subnets            = module.vpc.public_subnets
  alb_id                    = module.loadbalancer.alb_id
  depends_on                = [module.vpc,module.loadbalancer]
}




output "aws_security" {
  value = [module.vpc.security_groups_id,module.vpc.security_group_elb]
}

output "public_subnets" {
  value = module.vpc.public_subnets
}


output "private_subnets" {
  value = module.vpc.private_subnets
}

output "available_subnets" {
  value = module.loadbalancer.subnets
}

output "load_balancer_dns" {
  value = module.loadbalancer.alb_ame
}

