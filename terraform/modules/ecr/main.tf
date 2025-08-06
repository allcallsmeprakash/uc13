resource "aws_ecr_repository" "frontend" {
  name                 = "employee-frontend"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "Employee Frontend Repository"
  }
}

resource "aws_ecr_repository" "backend" {
  name                 = "employee-backend"
  image_tag_mutability = "MUTABLE"
  tags = {
    Name = "Employee Backend Repository"
  }
}
