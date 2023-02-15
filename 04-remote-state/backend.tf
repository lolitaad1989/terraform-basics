terraform {
  backend "s3" {
    bucket = "lolitaad1989-terraform-state-bucket"
    key    = "ec2/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
