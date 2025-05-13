variable "instance_type" {
  description = "Map of instance types for different workspaces"
  type        = map(string)
  
  default     = {
    dev     = "t2.micro"
    staging = "t2.small"
    prod    = "t2.large"
  }
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string  
}