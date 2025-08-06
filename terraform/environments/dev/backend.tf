terraform {
  backend "s3" {
    bucket = "training-usecases"
    key    = "uc13/terraform.tfstate"
    region = "us-east-1"
  }
}
