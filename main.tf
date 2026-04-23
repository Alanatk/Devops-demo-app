terraform {
required_providers {
aws = {
source = "hashicorp/aws"
version = "~> 5.0"
}
}
}

provider "aws" {
region = "ap-south-2"
}

data "aws_s3_bucket" "demo_bucket" {
  bucket = "alan0101"
}

resource "aws_vpc" "demo_vpc" {
cidr_block = "10.0.0.0/26"
}

resource "aws_subnet" "public_subnet" {
vpc_id = aws_vpc.demo_vpc.id
cidr_block = "10.0.0.0/26"
}

resource "aws_instance" "ec2" {
ami = "ami-0f5ee92e2d63afc18"
instance_type = "t3.small"
}
