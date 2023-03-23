resource "aws_s3_bucket" "storage_bucket" {
  bucket = var.storage_name

  tags = {
    Name        = "storage"
    Environment = "Production"
  }

  lifecycle {
    ignore_changes = [tags]
  }
}


resource "aws_s3_bucket_acl" "storage_acl" {
  bucket = aws_s3_bucket.storage_bucket.bucket
  acl    = "public-read"
}

resource "aws_s3_bucket_versioning" "storage_versioning" {
  bucket = aws_s3_bucket.storage_bucket.bucket

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_object" "storage" {
  for_each = fileset("${var.path_files}/", "*")
  bucket   = aws_s3_bucket.storage_bucket.id
  key      = each.value
  source   = "${var.path_files}/${each.value}"
  etag     = filemd5("${var.path_files}/${each.value}")
  acl      = "public-read"
}