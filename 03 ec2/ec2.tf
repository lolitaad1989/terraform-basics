provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "this" {
ami = "ami-0c1d144c8fdd8d690"
instance_type = "t3.micro"
tags = {
Name = "Terraform"
  }
}

output "public_dins_output" {
  value = aws_instance.this.public_dns
}