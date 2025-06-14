terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws"{
    region = "ap-south-1"
}

resource "aws_s3_bucket" "livanshu_bucket" {
  bucket = var.bucket_name
  force_destroy = true
  tags = {
    Owner = "livanshu"
  }
}
resource "aws_s3_bucket_public_access_block" "livanshu_pab" {
  bucket = aws_s3_bucket.livanshu_bucket.bucket

  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_website_configuration" "livnashu_bwc" {
  bucket = aws_s3_bucket.livanshu_bucket.bucket

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
resource "aws_s3_bucket_policy" "livanshu_bp" {
  bucket = aws_s3_bucket.livanshu_bucket.bucket
  policy = data.aws_iam_policy_document.public_read_policy.json
}
data "aws_iam_policy_document" "public_read_policy" {
  statement {
    actions = [ "s3:GetObject" ]
    resources = ["${aws_s3_bucket.livanshu_bucket.arn}/*"]
    principals {
      type = "AWS"
      identifiers = ["*"]
    }
  }
}
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.livanshu_bucket.bucket
  key = "new_object_key"
  source = "${path.module}/index.html"
  content_type = "text/html"
}