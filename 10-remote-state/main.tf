resource "null_resource" "main" {}

resource "null_resource" "bar" {}

resource "null_resource" "foo" {}

provider "aws" {}


terraform {
  backend "s3" {
    bucket = "b58-tf-state-08"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}