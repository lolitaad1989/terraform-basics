provider "aws" {
  region = "us-east-1"
}

variable "sg" {}

resource "aws_instance" "my-ec2" {
    ami = data.aws_ami.lab-image.image_id
    instance_type = "t2.micro"
    vpc_security_group_ids = [var.sg]
  }


output "public_dins_output" {
  value = aws_instance.my-ec2.public_dns
}