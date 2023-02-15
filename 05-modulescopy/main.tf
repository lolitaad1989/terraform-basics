module "ec2" {
  source = "./ec2"
  sg=module.sg.sg-id
}

module "sg" {
  source = "./sg"
}

# output "server_public_ip" {
#   value = module.ec2.public_dins_output
# }
