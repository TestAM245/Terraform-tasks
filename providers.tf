terraform {
   backend "s3" {
    bucket         = "my-s3-demo245"
    dynamodb_table = "state-lock"
    key            = "state/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
   }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = var.aws_region
}