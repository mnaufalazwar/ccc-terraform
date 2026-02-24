variable "aws_region" {
  description = "AWS region to deploy to"
  type        = string
  default     = "ap-southeast-1"
}

variable "project_name" {
  description = "Project name used as prefix for all resources"
  type        = string
  default     = "ccc"
}

variable "db_name" {
  description = "PostgreSQL database name"
  type        = string
  default     = "chitchatclub"
}

variable "db_username" {
  description = "PostgreSQL master username"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "PostgreSQL master password"
  type        = string
  sensitive   = true
}

variable "jwt_secret" {
  description = "JWT signing secret (base64, at least 256 bits)"
  type        = string
  sensitive   = true
}

variable "mail_password" {
  description = "Resend API key for sending emails"
  type        = string
  sensitive   = true
}

variable "mail_from" {
  description = "Email sender address (e.g., noreply@chitchatclubs.com)"
  type        = string
  default     = "noreply@chitchatclubs.com"
}

variable "domain_name" {
  description = "Custom domain name (leave empty to use CloudFront default URL)"
  type        = string
  default     = ""
}

variable "container_image" {
  description = "Docker image URI (set after first push to ECR)"
  type        = string
  default     = ""
}

variable "db_snapshot_identifier" {
  description = "RDS snapshot to create the database from (leave empty for a fresh database)"
  type        = string
  default     = ""
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN in us-east-1 for the custom domain (leave empty to use CloudFront default cert)"
  type        = string
  default     = ""
}

variable "use_custom_domain" {
  description = "Set to true after DNS switch to add the custom domain alias to CloudFront and update CORS"
  type        = bool
  default     = false
}