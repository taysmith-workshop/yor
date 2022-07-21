module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "11.0.0"
  labels = {
    test      = "true"
    yor_trace = "d14f8094-b85d-46b2-9932-cb914c5e6368"
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"
  tags = {
    test      = "true"
    yor_trace = "6de53a51-c1c0-4592-9156-49b0d02db643"
  }
}

module "project-factory_github" {
  source = "github.com/terraform-google-modules/terraform-google-project-factory"
  labels = {
    test      = "true"
    yor_trace = "2c2cccb9-c853-494b-a44c-0a3681ea153b"
  }
}

module "project-factory_git" {
  source = "git@github.com:terraform-google-modules/terraform-google-project-factory.git"
  labels = {
    test      = "true"
    yor_trace = "a9d0be88-52dc-40d6-967f-a1bf444ad41a"
  }
}

module "caf" {
  source = "aztfmod/caf/azurerm"
  tags = {
    test      = "true"
    yor_trace = "5923b6fb-a34c-43dd-9ca7-d85ae1aa101f"
  }
}

module "caf" {
  source = "git@github.com:aztfmod/terraform-azurerm-caf.git"
  tags = {
    test      = "true"
    yor_trace = "5923b6fb-a34c-43dd-9ca7-d85ae1aa101f"
  }
}

module "bastion" {
  source = "oracle-terraform-modules/bastion/oci"
  freeform_tags = {
    test      = "true"
    yor_trace = "8202b7d4-22db-43d1-861b-098d17d3dc08"
  }
}

module "run-common_logs" {
  // Tags attribute is extra_tags
  source  = "claranet/run-common/azurerm//modules/logs"
  version = "3.0.0"
  extra_tags = {
    test      = "true"
    yor_trace = "a37e937c-d82d-4eaa-a975-6eaed6f1babd"
  }
}