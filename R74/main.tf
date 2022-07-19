terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 4.0"

  for_each = toset(["p_one", "p_two"])

  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.large"
  monitoring    = true

}

