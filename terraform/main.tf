module "vpc" {
  source = "./modules/vpc"

  vpc_cidr                 = var.vpc_cidr
  vpc_name                 = var.vpc_name
  public_subnet_cidrs      = var.public_subnet_cidrs
  private_subnet_cidrs     = var.private_subnet_cidrs
  availability_zones       = var.availability_zones
  alb_sg_name              = var.alb_sg_name
  alb_sg_description       = var.alb_sg_description
  container_sg_name        = var.container_sg_name
  container_sg_description = var.container_sg_description
  container_ingress_port   = var.container_ingress_port
}


module "alb" {
  source                = "./modules/alb"
  alb_name              = var.alb_name
  alb_security_group_id = module.vpc.alb_sg_id
  alb_subnet_ids        = module.vpc.public_subnet_ids
  target_group_name     = var.target_group_name
  target_group_port     = var.target_group_port
  target_group_protocol = var.target_group_protocol
  vpc_id                = module.vpc.vpc_id
  acm_certificate_arn   = module.acm.acm_certificate_arn
}


module "route53" {
  source             = "./modules/route53"
  hosted_zone_domain = var.hosted_zone_domain
  record_name        = var.record_name
  alb_dns_name       = module.alb.alb_dns_name
}

module "acm" {
  source         = "./modules/acm"
  domain_name    = var.domain_name
  hosted_zone_id = module.route53.hosted_zone_id
}

module "ecs" {
  source                      = "./modules/ecs"
  cluster_name                = var.cluster_name
  iam_role_name               = var.iam_role_name
  iam_policy_name             = var.iam_policy_name
  task_definition_family      = var.task_definition_family
  task_cpu                    = var.task_cpu
  task_memory                 = var.task_memory
  container_name              = var.container_name
  docker_image                = var.docker_image
  container_cpu               = var.container_cpu
  container_memory            = var.container_memory
  container_port              = var.container_port
  service_name                = var.service_name
  desired_count               = var.desired_count
  private_subnet_ids          = module.vpc.private_subnet_ids
  container_security_group_id = module.vpc.container_sg_id
  target_group_arn            = module.alb.target_group_arn
}

