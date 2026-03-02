terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "ccc-tfstate-696637902012-ap-southeast-1"
    key            = "ccc/aws/prod/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "ccc-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

# CloudFront requires ACM certificates in us-east-1
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}