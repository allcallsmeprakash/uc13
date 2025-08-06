module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  subnet_ids      = var.private_subnet_ids
  vpc_id          = var.vpc_id

  enable_irsa = true

  node_groups = {
    backend_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_types = ["t3.medium"]
      subnet_ids     = var.private_subnet_ids

      additional_security_group_ids = [aws_security_group.backend_sg.id]
    }
  }

  fargate_profiles = {
    frontend = {
      selectors = [
        {
          namespace = "frontend"
        }
      ]
      subnet_ids = var.private_subnet_ids
    }
  }

  manage_aws_auth_configmap = true
  aws_auth_roles = var.aws_auth_roles
}

resource "aws_security_group" "backend_sg" {
  name        = "eks-backend-sg"
  description = "Security group for backend EC2 nodes"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-backend-sg"
  }
}
