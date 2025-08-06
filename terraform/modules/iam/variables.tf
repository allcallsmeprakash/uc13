variable "account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "oidc_provider_url" {
  description = "OIDC provider URL for EKS"
  type        = string
}
