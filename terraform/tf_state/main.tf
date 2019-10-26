resource "random_id" "tf_state_random_bucket" {
  byte_length = 8
}

resource "aws_s3_bucket" "tf_state_s3" {
  bucket = "tf-state-s3-${random_id.tf_state_random_bucket.hex}"
  force_destroy= true
#  versioning {
#    enabled = true
#  }
  tags = {
    Name = "S3 Remote Terraform State Store"
  }
}

resource "aws_dynamodb_table" "dynamodb_tf_state_lock" {
  name           = "tf-state-lock-${random_id.tf_state_random_bucket.hex}"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}