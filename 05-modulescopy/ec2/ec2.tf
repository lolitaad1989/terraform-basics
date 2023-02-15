provider "aws" {
  region = "us-east-1"
}

variable "sg" {}

resource "aws_instance" "my-ec2" {
  ami = "ami-0c1d144c8fdd8d690"
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.sg]
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = self.public_ip
    }
    inline = [
        "ls -ltr",
        "ansible-pull -U https://github.com/lolitaad1989/ansible.git -e COMPONENT=mongodb -e ENV=dev robot-pull.yml"
      ]
  }
}


output "public_dins_output" {
  value = aws_instance.my-ec2.public_dns
}