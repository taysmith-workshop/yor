resource "aws_security_group" "cluster" {
  name_prefix = "acme"
  description = "EKS cluster security group"
  vpc_id      = "vpc-123456"
  tags = merge(
    var.tags,
    {
      "Name" = "${var.env}-eks_cluster_sg"
    },
    {
      yor_trace = "ca66e08f-1f13-4704-9363-3d3b326da09c"
  })
}

resource "aws_vpc" "vpc_tags_one_line" {
  cidr_block = ""
  tags = { "Name" = "tag-for-s3", "Environment" = "prod"
    yor_trace = "581de0a8-e6c9-45d8-bbe5-3f721b330d9c"
  }
}

resource "aws_instance" "no_tags" {
  ami           = "some-ami"
  instance_type = "t3.micro"
  tags = {
    yor_trace = "9c7b9ced-0eae-426c-b908-64d504353fbc"
  }
}

resource "aws_instance" "simple_tags" {
  ami           = "some-ami"
  instance_type = "t3.micro"

  tags = {
    Name      = "my-instance"
    yor_trace = "fddbd05a-4915-4798-9a2a-0110724bfb67"
  }
}

resource "aws_instance" "rendered_tags" {
  ami           = "some-ami"
  instance_type = "t3.micro"

  tags = merge(var.tags, {
    yor_trace = "50d5dde2-ee47-4ccf-b585-2a8d806ae3c5"
  })
}

resource "aws_instance" "merge_tags" {
  ami           = "some-ami"
  instance_type = "t3.micro"

  tags = merge(var.tags,
    {
      Name = "merged-tags-instance",
      Env  = var.env
      }, {
      yor_trace = "e7db4721-31ed-461e-9232-038d9b91a9be"
  })
}

variable "tags" {
  default = {}
  type    = map(string)
}

variable "env" {
  default = "dev"
  type    = string
}