data "aws_ami" "lab-image" {
  ami = "ami-0e3aeafe193bbdd4a"
  instance_type = "t2.micro"
}