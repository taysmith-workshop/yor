resource "aws_s3_bucket" "bucket_module3" {
  bucket = "tf-test-bucket3"
  acl    = "public_read"
  versioning {
    enabled = false
  }

  tags = {
    "Name"    = "bucket3"
    yor_trace = "23397bf7-7dcf-435c-897d-1181edf33a9c"
  }
}
