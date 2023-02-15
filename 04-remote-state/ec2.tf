provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my-ec2" {
    count = 3
    ami = "ami-0c1d144c8fdd8d690"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
    Name = "Terraform"
    
  }
}

# output "public_dins_output" {
#   value = aws_instance.my-ec2.public_dns
# }