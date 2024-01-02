locals {
  variables = {
    PORT = var.container_port
  }
}


module "network" {
  source             = "./modules/network"
  cidr               = var.cidr
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  availability_zones = var.availability_zones
}

module "security_groups" {
  source         = "./modules/security_groups"
  name           = "${var.project}-${var.environment}"
  vpc_id         = module.network.vpc_id
  container_port = var.container_port
}

module "app" {
  source          = "./modules/app"
  name            = var.project
  environment     = var.environment
  task_cpu        = var.task_cpu
  task_memory     = var.task_memory
  image           = var.image
  container_port  = var.container_port
  vpc_id          = module.network.vpc_id
  public_subnets  = module.network.public_subnets
  alb_sg          = [module.security_groups.alb]
  ecs_sg          = [module.security_groups.ecs_tasks]
  subnets_private = module.network.private_subnets
  region          = var.region
  variables       = local.variables
  secrets         = var.secrets
  domain          = var.domain
}