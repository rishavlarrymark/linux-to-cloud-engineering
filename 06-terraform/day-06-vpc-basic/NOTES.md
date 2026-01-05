resource "aws_s3_bucket" "example" {
  bucket = "terraform-output-demo-12345"
}

output "bucket_arn" {
  value = aws_s3_bucket.example.arn
}
