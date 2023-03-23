module "layer" {
  source = "../terraform-aws-lambda-layer"

  lambda_layer_name = "LambdaNodejsNoiselessTechLayer"
  s3_bucket_id      = aws_s3_bucket.storage_bucket.id
  description = "Some meaningfully description"
}