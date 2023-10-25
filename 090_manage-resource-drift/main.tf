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
resource "aws_instance" "my_server" {
  ami           = "ami-0df435f331839b2d6"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0a96779c00837e82f"  # Specify your subnet ID here
	tags = {
		Name = "MyServer"
	}
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-new-bucket-421419084210"
}

output "public_ip" {
  value = aws_instance.my_server.public_ip
}