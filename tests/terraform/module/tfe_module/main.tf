module "tfe_module" {
  source = "app.terraform.io/path/to/module/aws"
  tags = {
    Application = "application"
    Env         = var.env
    yor_trace   = "22397669-5ab4-4c22-9dd8-84e9ab8e51fd"
  }
}