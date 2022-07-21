module "complete_sg" {
  source              = "terraform-aws-modules/security-group/aws"
  name                = "my-sg-test"
  vpc_id              = "some-vpc-id"
  use_name_prefix     = true
  ingress_cidr_blocks = ["10.10.0.0/16"]
  ingress_rules       = ["https-443-tcp"]

  tags = {
    Name      = "test-sg"
    yor_trace = "d0ff09d1-8904-4349-b3a4-a3d856a733ba"
  }
}