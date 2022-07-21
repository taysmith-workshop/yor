resource "aws_s3_bucket" "bucket_module1" {
  bucket = "tf-test-bucket-destination-12345"
  acl    = "private"
  versioning {
    enabled = false
  }
  tags = {
    yor_trace = "0bf12659-cdb7-4853-b0f6-97b546b1c2a8"
  }
}

module "moduleRef" {
  source = "../module2"
}
