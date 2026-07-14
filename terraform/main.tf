terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

module "vpc" {
  source = "./modules/vpc"
  project_name = "app-test-intern"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_1_cidr = "10.0.1.0/24"
  public_subnet_2_cidr = "10.0.2.0/24"
  az_1 = "ap-southeast-1a"
  az_2 = "ap-southeast-1b"
}

module "security_groups" {
  source = "./modules/security_groups"
  project_name = "app-test-intern"
  vpc_id = module.vpc.vpc_id
}

#module Load Balancer
module "alb" {
  source = "./modules/alb"

  project_name   = "app-test-intern"
  vpc_id         = module.vpc.vpc_id
  
  # Truyen 2 Public Subnet tu module VPC len
  public_subnets = [
    module.vpc.public_subnet_1_id, 
    module.vpc.public_subnet_2_id
  ]
  
  # Truyen Security Group cua ALB vao
  alb_sg_id      = module.security_groups.alb_sg_id
}