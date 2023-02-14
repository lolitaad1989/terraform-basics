output "sample" {
    value = "Hello World" 
}

variable "demo" {
  value = "Terraform Training"
}

output "printing-demo" {
  value = "Value is ${var.demo}"
}

output "print-demo" {
  value = var.demo
}