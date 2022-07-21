resource "aws_kms_key" "logs_key" {
  # key does not have rotation enabled
  description = "modified_description"

  deletion_window_in_days = 7
  tags = {
    yor_trace = "616011b9-e0a0-4b8c-a0de-bd6308bbf4a7"
  }
}

resource "aws_kms_alias" "logs_key_alias" {
  name          = "alias/${local.resource_prefix.value}-logs-bucket-key"
  target_key_id = "${aws_kms_key.logs_key.key_id}"
}
