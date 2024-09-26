# Count offers in list and it has it's own cons, so going through for-each will amplify on what we are doing
resource "aws_instance" "main" {
  for_each               = var.components
  ami                    = "ami-0fcc78c828f981df2"
  instance_type          = each.value["instance_type"]
  vpc_security_group_ids = ["sg-08c9eb09595f5de07"]

  tags = {
    Name = each.key
    bu   = each.value["bu"]
  }
}

variable "components" {
  default = {
    frontend = { # each.key
      bu            = "development"
      instance_type = "t3.small"

    }
    backend = {
      instance_type = "t3.micro" # each.value
      bu            = "development"
    }
    mysql = {
      instance_type = "t2.micro"
      bu            = "dba"
    }
  }
}


### key is frontend  ( which can be called by each.key )
### All the values of it can be referenced by using each.value or to pick a specific value we go as shown.