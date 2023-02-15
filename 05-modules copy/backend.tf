terraform {
  backend "s3" {
    bucket = "lolitaad1989-terraform-state-bucket"
    key    = "modules/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {}

//this is for s3 bucket