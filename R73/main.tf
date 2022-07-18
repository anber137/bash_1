terraform {
  required_version = ">= 0.12"
}

variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-west-2"
}

provider "aws" {
  region = var.aws_region
}

//https://github.com/hashicorp/terraform-provider-aws/blob/main/examples/count/main.tf
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

/*
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name =  "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name =  "owner-alias"
    values = ["amazon"]
  }
}
*/

locals {
  web_instance_type_map = {
  stage = "t3.micro"
  prod = "t3.large"
  }
  
  web_inst_count_map = {
    stage = 1
    prod  = 2
  }
#5
  instances = {
    "t3.micro" = data.aws_ami.amazon_linux.id
    "t3.micro" = data.aws_ami.amazon_linux.id
  }
}

resource "aws_instance" "web" {
  ami = data.aws_ami.amazon_linux.id 
#3
  instance_type = local.web_instance_type_map[terraform.workspace]
#4
  count = local.web_inst_count_map[terraform.workspace]
#6  
  lifecycle {
    create_before_destroy = true
  }
}

#5
resource "aws_instance" "web_for_each" {
  for_each = local.instances
  ami = each.value
  instance_type = each.key
#7
  timeouts{
    create = "60m"
  }
}

