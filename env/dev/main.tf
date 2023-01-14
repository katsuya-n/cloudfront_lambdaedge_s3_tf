provider "aws" {
  region = local.region

  default_tags {
    tags = {
      System      = local.name_suffix
      Owner       = "knakano"
      Environment = local.env
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.29.0"
    }
  }
  required_version = "1.3.5"
  backend "s3" {
    bucket = "knakano-cloudfront-lambda-s3-tfstate-us-east-1"
    key    = "dev.tfstate"
    region = "us-east-1"
  }
}

module "s3" {
  source                                          = "../../modules/s3"
  bucket_name                                     = "knakano-static-cloudfront-lambda-s3-${local.name_suffix}"
  aws_cloudfront_distribution_s3_distribution_arn = module.cloudfront.aws_cloudfront_distribution_s3_distribution_arn
}

module "cloudfront" {
  source         = "../../modules/cloudfront"
  s3_origin_id   = module.s3.aws_s3_bucket_static_id
  s3_domain_name = module.s3.aws_s3_bucket_static_bucket_regional_domain_name
}