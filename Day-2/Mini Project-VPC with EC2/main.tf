# This Terraform script creates a VPC with an Internet Gateway, a public subnet, a route table, and an EC2 instance with Apache installed.

resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt.id
}

# The security group allows HTTP and SSH access from anywhere. It also allows all outbound traffic.
# The security group is associated with the EC2 instance.
# The EC2 instance is created in the public subnet and is associated with the security group.
# The EC2 instance is configured to serve a simple HTML page with its instance ID.


resource "aws_security_group" "web_sg" {
  name   = "web-sg"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
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

  tags = {
    Name = "Web-SG"
  }
}

# The EC2 instance is created with a user data script that installs Apache and creates an HTML page with the instance ID.

resource "aws_instance" "web_server" {
  ami                    = "ami-012345bbcb8c4a12"   # Use latest Amazon Linux 2 AMI in real time
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    apt update
    apt install -y apache2
    INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
    apt install -y awscli
    echo "<html><body><h1>Terraform EC2 Instance</h1><h2>Instance ID: $INSTANCE_ID</h2></body></html>" > /var/www/html/index.html
    systemctl start apache2
    systemctl enable apache2
  EOF

  tags = {
    Name = "Terraform-Web-Server"
  }
}