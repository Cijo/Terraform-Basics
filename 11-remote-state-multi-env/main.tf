resource "null_resource" "sample" {}

resource "null_resource" "simple" {}

resource "null_resource" "dimple" {}

provider "aws" {}


terraform {
  backend "s3" {}
}