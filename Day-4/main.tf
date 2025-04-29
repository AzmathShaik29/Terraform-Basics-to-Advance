provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "Terraform" {
    ami = "ami-0125b180cbfafe1f0"   # Amazon Linux 2 AMI, change as per your region
    instance_type = "t2.micro"
}
resource "aws_s3_bucket" "s3_bucket" {
    bucket = "my-unique-bucket-name"  # Replace with a globally unique bucket name
}

resource "aws_dynamodb_table" "terraform_locking" {
    name         = "terraform-locking"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"
    
    attribute {
        name = "LockID"
        type = "S"
    }
}