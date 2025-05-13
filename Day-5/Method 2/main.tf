provider "aws" {
  region = "us-east-1"
}

module "ec2-instance" {
    source = "./Modules/EC2-Instance"
    instance_type = "var.instance_type"
    ami = "var.ami"
}
