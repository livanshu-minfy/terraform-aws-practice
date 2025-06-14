terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }

  backend "s3" {
    bucket="livanshu-terraform-state-1210"
    key="assignment-03/terraform.tfstate"
    region="ap-south-1"
  }
}