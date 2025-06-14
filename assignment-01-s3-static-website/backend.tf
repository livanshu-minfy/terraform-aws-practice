terraform {
  backend "s3" {
    bucket = "livanshu-terraform-state-1210"
    key = "assignment-1/terraform.tfstate"
    region = "ap-south-1"
  }
}