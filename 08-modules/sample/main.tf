# Backend Module 

resource "null_resource" "sample" {
  count = length(var.colors) # step-4 ; you can use it
}


variable "colors" {} # Step-3
# Variables that are used in the root module should be mentioned here
# This is how we are going to receive the information from the module



### Passing the info from backend to root modules
output "msg" {
  value = "Welcome To Terraform" ### Passing info from child-module to root - mdoule ; step-1
}