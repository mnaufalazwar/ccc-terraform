variable "github_owner" {
  description = "GitHub org/user owner"
  type        = string
}

variable "backend_repo" {
  description = "Backend repo name"
  type        = string
  default     = "ccc-backend"
}

variable "frontend_repo" {
  description = "Frontend repo name"
  type        = string
  default     = "ccc-frontend"
}

variable "backend_branch_pattern" {
  description = "Git ref pattern allowed for backend deploy role"
  type        = string
  default     = "release/*"
}

variable "frontend_branch_pattern" {
  description = "Git ref pattern allowed for frontend deploy role"
  type        = string
  default     = "release/*"
}

variable "backend_role_name" {
  description = "IAM role name for backend deployments"
  type        = string
  default     = "GitHubActionsBackendDeployRole"
}

variable "frontend_role_name" {
  description = "IAM role name for frontend deployments"
  type        = string
  default     = "GitHubActionsFrontendDeployRole"
}

variable "backend_policy_json" {
  description = "IAM policy JSON for backend deploy permissions"
  type        = string
}

variable "frontend_policy_json" {
  description = "IAM policy JSON for frontend deploy permissions"
  type        = string
}