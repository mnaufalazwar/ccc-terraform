module "github_actions_oidc" {
  source = "./modules/github_oidc_deploy"

  github_owner = "mnaufalazwar"

  backend_repo  = "ccc-backend"
  frontend_repo = "ccc-frontend"

  backend_branch_pattern  = "release/**"
  frontend_branch_pattern = "release/**"

  backend_policy_json  = data.aws_iam_policy_document.backend_policy.json
  frontend_policy_json = data.aws_iam_policy_document.frontend_policy.json
}