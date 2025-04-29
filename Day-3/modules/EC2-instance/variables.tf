variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default     = "t2.micro"
  
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-012345bfafe1f0" # Amazon Linux 2 AMI, replace with your AMI ID
  
}
