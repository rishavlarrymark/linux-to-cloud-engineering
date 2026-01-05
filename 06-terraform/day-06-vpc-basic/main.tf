variable "environment" {
  default = "dev"
}

locals {
  common_tags = {
    Environment = var.environment
    Owner       = "rishav"
    CostCenter  = "learning"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "terraform-locals-demo-12345"
  tags   = local.common_tags
}
