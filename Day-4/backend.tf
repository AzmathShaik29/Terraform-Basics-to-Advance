terraform {
    backend "s3" {
        bucket         = "my-unique-bucket-name"  # Replace with your S3 bucket name
        key            = "terraform/state"
        region         = "us-east-1"
        encryption     = true
        dynamodb_table = "terraform-locking"
    }
}