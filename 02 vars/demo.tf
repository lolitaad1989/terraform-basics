variable "City" {}
variable "Town" {} 

output "Print-city" {
  value = "Name of the city is ${var.City} and the town is ${var.Town}"
}