resource "aws_instance" "main" {
  count                  = length(var.components)
  ami                    = "ami-0fcc78c828f981df2"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-08c9eb09595f5de07"]

  tags = {
    Name = var.components[count.index]
  }
}

variable "components" {
  default = ["frontend", "mysql", "backend"]
}
