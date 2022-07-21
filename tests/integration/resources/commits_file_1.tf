provider "aws" {

}

resource "aws_s3_bucket" "financials" {
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "yor-test-1"
  acl           = "private"
  force_destroy = true

  tags = {
    yor_trace = "a745d0b4-5fb4-4315-aa18-a26aef3140c7"
  }
}