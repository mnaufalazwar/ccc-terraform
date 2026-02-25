output "cloudfront_url" {
  description = "CloudFront distribution URL"
  value       = "https://${aws_cloudfront_distribution.main.domain_name}"
}

output "alb_dns" {
  description = "ALB DNS name"
  value       = aws_lb.main.dns_name
}

output "ecr_repository_url" {
  description = "ECR repository URL (for docker push)"
  value       = aws_ecr_repository.backend.repository_url
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.main.endpoint
}

output "s3_bucket" {
  description = "Frontend S3 bucket name"
  value       = aws_s3_bucket.frontend.id
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID (for cache invalidation)"
  value       = aws_cloudfront_distribution.main.id
}

output "ecs_cluster_name" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.main.name
}

output "ecs_service_name" {
  description = "ECS service name"
  value       = aws_ecs_service.backend.name
}

output "github_actions_backend_role_arn" {
  description = "IAM role ARN for ccc-backend GitHub Actions deploy"
  value       = module.github_actions_oidc.backend_role_arn
}

output "github_actions_frontend_role_arn" {
  description = "IAM role ARN for ccc-frontend GitHub Actions deploy"
  value       = module.github_actions_oidc.frontend_role_arn
}
