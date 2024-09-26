data "aws_route53_zone" "main" {
  name         = "expense.internal"
  private_zone = true
}

data "aws_security_group" "main" {
  filter {
    name   = "group-name"       # As per teh documentation : https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSecurityGroups.html
    values = ["b58-allows-all"] # Name of your security groups that was created by you during the start of the project
  }
}

data "aws_ami" "main" {
  most_recent = true
  name_regex  = "DevOps-LabImage-RHEL9"
  owners      = ["355449129696"]
}

