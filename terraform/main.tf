terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket         = "hello-aws-app-terraform-state"
    key            = "hello-aws-app/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "hello-aws-app-terraform-locks"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}
