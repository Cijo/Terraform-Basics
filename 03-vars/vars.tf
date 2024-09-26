# variable "a" {}     # This is called empty variable
# Supported datatypes in terraform
# 1) Numbers 
# 2) Boolents 
# 3) Strings


variable "a" {
  default = 10 # This is how we declare value to a default variable 
}

output "op" {
  value = var.a # This is how we access a variable
}


# List variable 
variable "sample" {
  default = [
    100,
    "terraform",
    true
  ]
}

# printing whole list variable
output "sample_op" {
  value = var.sample
}

output "sample_op_works" {
  value = "Current topics is ${var.sample[1]} and this supports more than ${var.sample[0]} cloud providers"
}


# var.sample    : use this only if this is not in between a set of strings 
# #{var.sample} : use this if your varaible has to be enclosed in a set of strings


# Map Varaible 

variable "m" {
  default = {
    name    = "Mike",
    content = "DevOps",
    salary  = 10000
  }
}

output "m_op" {
  value = var.m
}

output "m_op_words" {
  value = "${var.m["name"]} is a ${var.m["content"]} engineer and his salary is ${var.m["salary"]}"
}

### Printing variable values from a file 

variable "state_rank" {}
output "rank" {
  value = var.state_rank
}

# Environment specific variables
variable "env" {}
variable "ins_type" {}

output "env" {
  value = "Current environment is ${var.env} and here we use only ${var.ins_type}"
}

variable "city" {}
output "city" {
  value = "${var.city} is IT Hub"
}