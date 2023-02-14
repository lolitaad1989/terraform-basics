provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my-ec2" {
ami = "ami-0c1d144c8fdd8d690"
instance_type = "t2.micro"
tags = {
Name = "Terraform"
  }
}

output "public_dins_output" {
  value = aws_instance.my-ec2.public_dns
}