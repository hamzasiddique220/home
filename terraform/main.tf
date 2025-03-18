provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id             = var.public_subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_pair_name

  tags = {
    Name = "Bastion-Host"
  }
}

variable "aws_region" {}
variable "ami_id" {}
variable "instance_type" {
  default = "t3.micro"
}
variable "public_subnet_id" {}
variable "security_group_id" {}
variable "key_pair_name" {}

