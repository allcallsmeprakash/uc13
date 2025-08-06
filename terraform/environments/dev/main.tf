terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.20"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.10"
    }
  }
}



provider "aws" {
  region = var.region
}

module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "eks" {
  source              = "../../modules/eks"
  cluster_name        = var.cluster_name
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_subnets
  aws_auth_roles      = var.aws_auth_roles
}

module "iam" {
  source             = "../../modules/iam"
  account_id         = var.account_id
  oidc_provider_url  = module.eks.cluster_oidc_issuer_url
}

module "rds" {
  source              = "../../modules/rds"
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_subnets
  db_username         = var.db_username
  db_password         = var.db_password
}

module "alb" {
  source             = "../../modules/alb"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnets
}

module "k8s" {
  source          = "../../modules/k8s"
  frontend_image  = var.frontend_image
  backend_image   = var.backend_image
}


module "ecr" {
  source = "../../modules/ecr"
}

