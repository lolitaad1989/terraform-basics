variable "City" {}
variable "Town" {} 

output "print city and town name" {
  value = "Name of the city is ${var.City} and the town is ${var.Town}"
}