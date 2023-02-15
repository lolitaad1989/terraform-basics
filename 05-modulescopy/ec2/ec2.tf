# creates ec2 instance
resource "aws_instance" "my-ec2" {
  ami                     = "ami-0c1d144c8fdd8d690"
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [var.sg]

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = self.public_ip         # self. will only work if it's inside the resource ; If not, we need to use aws_instance.my-ec2.public_ip
      }

      inline = [
          "ansible-pull -U https://github.com/b52-clouddevops/ansible.git -e COMPONENT=mongodb -e ENV=dev robot-pull.yml"
        ]
    }
}

# Before you use the variable from the root module, ensure you declare an empty variable.
variable "sg" {}


output "public_ip_address" {
    value = aws_instance.my-ec2.public_ip
}


# Patching of your EC2 & AMI has to be taken care as a part of the monthly maintenance.

# How do we patch the AMI ???
### Answer : Make an instance out of that AMI, update the server with latest pathces; Then , make AMI out of it with the same name and then deresigter the old AMI.
#### Airlines-Proj-X-1-Feb ;  Airlines-Proj-X-2-Mar ;

# PS : If you keep the provisioner inside the resource, if the provisioner fails for any reason, it assumes that the whole block is a failure and then it destroy and recreates in the next run.



# provider "aws" {
#   region = "us-east-1"
# }

# variable "sg" {}

# resource "aws_instance" "my-ec2" {
#   ami = "ami-0c1d144c8fdd8d690"
#   instance_type = "t2.micro"
#   vpc_security_group_ids = [var.sg]
#   provisioner "remote-exec" {
#     connection {
#       type     = "ssh"
#       user     = "centos"
#       password = "DevOps321"
#       host     = self.public_ip
#     }
#     inline = [
#         "ls -ltr",
#         "ansible-pull -U https://github.com/lolitaad1989/ansible.git -e COMPONENT=mongodb -e ENV=dev robot-pull.yml"
#       ]
#   }
# }


# output "public_dins_output" {
#   value = aws_instance.my-ec2.public_dns
# }