output "bucket" {
  value = aws_s3_bucket.tf_state_s3.bucket
}

output "dynamodb_table" {
  value = aws_dynamodb_table.dynamodb_tf_state_lock.name
}
