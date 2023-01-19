module "s3-bucket" {
  source = "./infra-modules/s3-bucket"
   bucket_id = module.s3-bucket.bucket_id
}
module "iam" {
  source = "./infra-modules/iam"
  arn = module.s3-bucket.arn
}
module "cloudfront" {
  source = "./infra-modules/cloudfront"
  domain = module.s3-bucket.domain
}