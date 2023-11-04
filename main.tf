terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.21.0"
    }
  }

  required_version = "~> 1.6.0"

  backend "s3" {
    region         = "sa-east-1"
    bucket         = "leofranzen-terraform-state-dev"
    key            = "terraform.tfstate"
    dynamodb_table = "terraform-state-lock-dev"
    encrypt        = true
  }
}

provider "aws" {
  profile = "default"
  region  = var.region

  default_tags {
    tags = {
      Environment = var.environment
      Terraform   = "true"
    }
  }
}
