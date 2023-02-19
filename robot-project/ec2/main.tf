
resource "aws_spot_instance_request" "my_spot_server" {
  ami                     = "ami-0e3aeafe193bbdd4a"
  instance_type           = "t3.micro"
  vpc_security_group_ids  = [aws_security_group.allows_all.id]

  wait_for_fulfillment  = true               # terraform job will only be completed if the reques is fulfilled. If not, tf wails for 10 mins and timesout.

  tags = {
    Name = var.COMPONENT
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = self.public_ip         # self. will only work if it's inside the resource ; If not, we need to use aws_instance.my-ec2.public_ip
      }

      inline = [
          "ansible-pull -U https://github.com/lolitaad1989/ansible.git -e COMPONENT=${var.COMPONENT} -e ENV=dev -e APP_VERSION=${var.APP_VERSION} -e ENV=dev robot-pull.yml"
        ]
    }
}
