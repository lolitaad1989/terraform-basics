variable "City" {}
variable "Town" {} 
variable "Project" {}

output "Print-city" {
  value = "Name of the city is ${var.City} and the town is ${var.Town} and project is ${var.Project}"
}