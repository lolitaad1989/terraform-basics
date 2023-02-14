output "sample" {
    value = "Hello World" 
}

variable "demo" {
  default ="Terraform Training"
}

output "printing-demo" {
  value = "Value is ${var.demo}"
}

output "print-demo" {
  value = var.demo
}

variable "example-list" {
  default = [
    "AWS",
    "Devops",
    true,
    100,
    "SRE"
  ]
}

output "ex-list-op" {
  value = "Welcome to $(var.example-list[0]) and $(var.example-list[1]) training. Training duration is $(var.example-list[2]) hours and you can also apply for $(var.example-list[3]) jobs"
}
