provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myinstance" {
  ami           = var.ami
  instance_type = var.instance_type 
}