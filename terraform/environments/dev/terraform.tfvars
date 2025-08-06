region         = "us-east-1"
vpc_cidr       = "10.0.0.0/16"
cluster_name   = "employee-directory"
account_id     = "082041771564"

db_username    = "admin"
db_password    = "SuperSecurePassword123!"

frontend_image = "082041771564.dkr.ecr.us-west-2.amazonaws.com/employee-frontend:latest"
backend_image  = "082041771564.dkr.ecr.us-west-2.amazonaws.com/employee-backend:latest"

aws_auth_roles = [
  {
    rolearn  = "arn:aws:iam::123456789012:role/GitHubActionsDeployRole"
    username = "github"
    groups   = ["system:masters"]
  }
]
