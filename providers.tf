# Terraform and Provider Blocks
terraform {
  required_providers {
    aws = {
      version = "~> 4.55"
      source  = "hashicorp/aws"
    }
  }
  
#####Uncomment this backend section after creating s3 bucket and dynamodb table####
  backend "s3" {
    bucket = "terraform-week3"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tbl-week3"
  }

}

provider "aws" {
  region = var.aws_region
}