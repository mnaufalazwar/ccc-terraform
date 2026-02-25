data "tls_certificate" "github_oidc" {
  url = "https://token.actions.githubusercontent.com"
}

resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.github_oidc.certificates[0].sha1_fingerprint]
}

data "aws_iam_policy_document" "backend_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${var.github_owner}/${var.backend_repo}:ref:refs/heads/${var.backend_branch_pattern}"]
    }
  }
}

resource "aws_iam_role" "backend_deploy_role" {
  name               = var.backend_role_name
  assume_role_policy = data.aws_iam_policy_document.backend_assume.json
}

resource "aws_iam_policy" "backend_permission_policy" {
  name   = "${var.backend_role_name}-policy"
  policy = var.backend_policy_json
}

resource "aws_iam_role_policy_attachment" "backend" {
  role       = aws_iam_role.backend_deploy_role.name
  policy_arn = aws_iam_policy.backend_permission_policy.arn
}

data "aws_iam_policy_document" "frontend_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${var.github_owner}/${var.frontend_repo}:ref:refs/heads/${var.frontend_branch_pattern}"]
    }
  }
}

resource "aws_iam_role" "frontend_deploy_role" {
  name               = var.frontend_role_name
  assume_role_policy = data.aws_iam_policy_document.frontend_assume.json
}

resource "aws_iam_policy" "frontend_permission_policy" {
  name   = "${var.frontend_role_name}-policy"
  policy = var.frontend_policy_json
}

resource "aws_iam_role_policy_attachment" "frontend" {
  role       = aws_iam_role.frontend_deploy_role.name
  policy_arn = aws_iam_policy.frontend_permission_policy.arn
}