output "bucket_id" {
  description = "The ID of the Bucket"
  value       = aws_s3_bucket.react_bucket.id
}
output "arn"{
  description = "arn of buscket"
  value = aws_s3_bucket.react_bucket.arn
}
output "domain"{
  description = "domain name"
  value = aws_s3_bucket.react_bucket.bucket_regional_domain_name
}