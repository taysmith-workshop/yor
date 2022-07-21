resource aws_s3_bucket "test-bucket" {
  name = "test-bucket"
  tags = {
    yor_trace = "d740327e-7a19-4153-b22a-7f72d545e9de"
  }
}

resource tls_private_key "pem" {
  algorithm = "some-algo"
}