variable "instance_type" {
  description = "Type of instance to create"
  type        = string
  
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}