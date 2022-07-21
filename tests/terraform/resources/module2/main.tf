resource "aws_s3_bucket" "bucket_module2" {
  bucket = "tf-test-bucket2"
  acl    = "public_read"
  versioning {
    enabled = false
  }

  tags = {
    "Name"    = "bucket2"
    yor_trace = "dc5cfaa7-db3f-44bb-ad6a-e3fd2a0277ad"
  }
}

module "moduleRef2" {
  source = "../module3"
}
