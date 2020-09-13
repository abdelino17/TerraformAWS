# Require TF version to be same as or greater than 0.12.13
terraform {
  required_version = ">=0.12.13"
  backend "s3" {
   bucket         = "abtech-bootstrap"
   key            = "terraform.tfstate"
   region         = "eu-west-3"
   dynamodb_table = "aws-locks"
   encrypt        = true
  }
}

# Download any stable version in AWS provider of 2.36.0 or higher in 2.36 train
provider "aws" {
  region  = "eu-west-3"
  version = "~> 2.36.0"
}

module "bootstrap" {
  source                      = "./modules/bootstrap"
  name_of_s3_bucket           = "abtech-experiments"
  dynamo_db_table_name        = "aws-locks"
}