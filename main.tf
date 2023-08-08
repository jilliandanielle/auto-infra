provider "aws" {
  region = "eu-west-2"  
}

#define VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

#Define subnets- one public, one private
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
}

#define security groups
resource "aws_security_group" "my_security_group" {
  name        = "my-security-group"
  description = "My security group"

  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


