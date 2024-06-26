terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = var.aws_region

  default_tags {
    tags = {
      name        = var.project
      created     = "terraform"
      Environment = var.environment
    }
  }
}