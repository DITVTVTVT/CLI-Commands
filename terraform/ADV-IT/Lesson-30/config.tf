
provider "aws" {
  region = "us-west-2" // Region where to Create Resources
}

terraform {
  backend "s3" {
    bucket = "dimmm-terraform-state" // Bucket where to SAVE Terraform State
    key    = "prod/terraform.tfstate" // Object name in the bucket to SAVE Terraform State
    region = "us-west-2"              // Region where bucket is created
  }
}
