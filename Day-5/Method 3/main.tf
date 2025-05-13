provider "aws" {
  region = "us-east-1"
}

module "ec2-instance" {
  source = "./Modules/Ec2-Instance"
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
  ami = var.ami
}
