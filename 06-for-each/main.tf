variable "fruits" {
  default = {
    apple  = {}
    grapes = {}
    banana = {}
  }
}

resource "null_resource" "main" {
  for_each = var.fruits
}