resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  tags = {
    region = var.region
    Environment = var.environment
  }
}