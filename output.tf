output "bucket" {
  value = aws_s3_bucket.storage_bucket.bucket
}

output "result_lambda_invocation" {
  value = aws_lambda_invocation.lambda_invocation.result
}