resource "aws_spot_instance_request" "my_spot_server" {
  ami = "ami-0e3aeafe193bbdd4a"
  instance_type = "t3.micro"
  wait_for_fulfillment = true
  tags = {
      Name = var.COMPONENT
    }
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = self.public_ip
    }
    inline = [
      "ansible-pull -U https://github.com/lolitaad1989/ansible.git -e COMPONENT=frontend -e APP_VERSION -e ENV=dev robot-pull.yml"
    ]
  }
}