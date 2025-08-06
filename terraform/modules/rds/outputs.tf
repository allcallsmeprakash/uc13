output "rds_endpoint" {
  value = aws_db_instance.employee_db.endpoint
}

output "rds_secret_arn" {
  value = aws_secretsmanager_secret.db_credentials.arn
}
