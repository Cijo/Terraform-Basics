# Calling a backend module which is locally available 
# Root Module

# An example to demonstrate how to send the information from root module to the backend module while calling.
module "test" {
  source = "./sample"
  colors = var.colors # This is how we pass the info to the backend module from the root module ; step-3
}


variable "colors" {} # step-2

### Whatever the variables that you're defining here, should also be defined in the backend as an empty variable

output "dev" {
  value = module.test.msg # ### Passing info from child-module to root - mdoule ; step-2
}



#### Modules can also be iterated using loops, it's always recommended to iterate the modules rather the resources.