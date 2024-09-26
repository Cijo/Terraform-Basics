variable "fruits" {}

# Using lookup funciton, we can return a default value of the key is not defined
output "apple" {
  value = " Apple color is ${lookup(var.fruits["apple"], "color", "green")} and  price is  ${lookup(var.fruits["apple"], "price", "100")}"
}

output "grapes" {
  value = " Graphes color is  ${lookup(var.fruits["grapes"], "color", "green")} and price is  ${lookup(var.fruits["grapes"], "rate", "50")}"
}