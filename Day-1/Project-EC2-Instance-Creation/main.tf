provider "AWS" {
  region = "us-east-1"                      # Replace with your region
  
}

resource "aws_instance" "my_first_instance" {
  ami           = "ami-0c55b159cbfafe1f0"   # Replace with your AMI ID
  instance_type = "t2.micro"                # Replace with your instance type
  key_name      = "mykey"                   # Replace with your key name
  security_groups = ["my_first_sg"]         # Replace with your security group name
  tags = {                                  
    Name = "my_first_instance"
  }
}