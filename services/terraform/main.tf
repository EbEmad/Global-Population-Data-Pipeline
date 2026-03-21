terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {

  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

   # Skip real AWS validations —> we're using LocalStack
   skip_credentials_validation = true
   skip_metadata_api_check = true
   skip_requesting_account_id = true
   s3_use_path_style = true
  endpoints {
    s3             = var.localstack_endpoint
  }
}

# Local variables — computed from input variables, reused across all resources
locals {
  project     = var.project
  region      = var.aws_region
  account_id  = var.aws_account_id
  environment = var.environment
}