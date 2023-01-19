resource "aws_s3_bucket" "react_bucket" {
  bucket = var.bucket_name
  acl    = var.acl_value

  tags = {
    Name = var.bucket_name
  }

  versioning {
    enabled = var.versioning
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = var.bucket_id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
