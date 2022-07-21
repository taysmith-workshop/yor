resource "aws_instance" "many_instance_tags" {
  ami           = ""
  instance_type = ""
  tags = merge({ "Name" = "tag-for-instance", "Environment" = "prod" },
    { "Owner" = "bridgecrew"
    },
    { "yor_trace" = "4329587194",
      "git_org"   = "bana" }, {
      Name        = "tag-for-instance"
  })
}

resource "aws_alb" "alb_with_merged_tags" {
  tags = merge({ "Name" = "tag-for-alb", "Environment" = "prod" },
    { "yor_trace" = "4329587194",
      "git_org"   = "bana" }, {
      Name        = "tag-for-alb"
  })
}

resource "aws_vpc" "vpc_tags_one_line" {
  cidr_block = ""
  tags = { "Name" = "tag-for-s3", "Environment" = "prod"
    yor_trace = "4166e3f3-24ba-4db6-a315-f210715efcc4"
  }
}

resource "aws_s3_bucket" "bucket_var_tags" {
  tags = merge(var.tags, {
    yor_trace = "3da8f126-43b7-40ea-9a81-2f3604ce417e"
  })
}

variable "tags" {
  default = {
    "Name"        = "tag-for-s3"
    "Environment" = "prod"
  }
}

resource "aws_instance" "instance_merged_var" {
  ami           = ""
  instance_type = ""
  tags = merge(var.tags,
    { "yor_trace" = "4329587194",
  "git_org" = "bana" })
}

variable "new_env_tag" {
  default = {
    "Environment" = "old_env"
  }
}

resource "aws_instance" "instance_merged_override" {
  ami           = ""
  instance_type = ""
  tags = merge(var.new_env_tag, { "Environment" = "new_env" }, {
    yor_trace = "e7201bd4-6281-4722-9ec8-7dc26a2b5c13"
  })
}

resource "aws_instance" "instance_empty_tag" {
  ami           = ""
  instance_type = ""
  tags = {
    yor_trace = "501d4cdb-76cb-4d61-a533-3c566a38bc7e"
  }
}

resource "aws_instance" "instance_no_tags" {
  ami           = ""
  instance_type = ""
  tags = {
    yor_trace = "d5ded9b3-7d79-4636-8a3e-4fdb2399c274"
  }
}

resource "aws_instance" "instance_null_tags" {
  ami           = ""
  instance_type = ""
  tags = {
    yor_trace = "8af3bf3e-4222-4962-8750-dc74c94b29c3"
  }
}

resource "aws_autoscaling_group" "autoscaling_group_tagged" {
  // This resource should not be tagged
  tag {
    key                 = "Name"
    propagate_at_launch = false
    value               = "Mine"
  }
  max_size = 0
  min_size = 0
}

resource "aws_autoscaling_group" "autoscaling_group" {
  // This resource should not be tagged as well
  max_size = 0
  min_size = 0
}