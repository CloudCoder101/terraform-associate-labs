terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.58.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "our_server" {
  ami           = "ami-0df435f331839b2d6"
  instance_type = "t2.micro"

  subnet_id = "subnet-0a96779c00837e82f" # Specify your subnet ID here
  # vpc_id = "vpc-0cf271fafe4938239"  # Specify your VPC ID here

  tags = {
    Name = "MyServer"
  }
}

output "public_ip" {
  value = aws_instance.our_server[*].public_ip
}