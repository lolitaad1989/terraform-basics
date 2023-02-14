provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "this" {
ami = "ami-0e3aeafe193bbdd4a"
instance_type = "t3.micro"
tags = {
Name = "Terraform"
  }
}

output "public_dins_output" {
  value = aws_instance.this.public_dns
}