provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA3C4SN32ZUEZ5JAEZ"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami = "ami-048ff3da02834afdc"
  //instance_type = var.types["us-east-1"]
  instance_type = var.lists[1]
  //count         = var.flag == true ? 2 : 1
  tags          = local.common-tags
}

//local variable
locals {
  common-tags = {
    own = "jphm"
  }
}

//List data-type
variable "lists" {
  type    = list(any)
  default = ["m5.large", "t2.micro"]
}

//Map data-type
variable "types" {
  type = map(any)
  default = {
    us-east-1 = "t2.micro"
    us-west-2 = "t2.nano"
  }
}
