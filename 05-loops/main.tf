resource "null_resource" "main" {
  count = 3 # count goes by list and each and every iteration is defined by a index number
}

resource "null_resource" "fruits" {
  count = length(var.fruits)
}

variable "fruits" {
  default = ["grapes", "orange", "peer"]
}