#________Create S3 Bucket______

resource "aws_s3_bucket" "tfstate_bucket" {
  bucket = "my-s3-demo245"
}


resource "aws_s3_bucket_versioning" "versioning_s3" {
  bucket = aws_s3_bucket.tfstate_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.tfstate_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}


# #_________Create DynamoDB Table__________

resource "aws_dynamodb_table" "statelock" {
  name           = "state-lock"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
   name = "LockID"
   type = "S"
  }
}