output "backend_role_arn" {
  value = aws_iam_role.backend_deploy_role.arn
}

output "frontend_role_arn" {
  value = aws_iam_role.frontend_deploy_role.arn
}