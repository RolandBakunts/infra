locals {
  region  = "us-east-1"
  project = "terragrunt-infra-rlbk"
  domain  = "learning-rolandwebsite.website"
}

inputs = {
  region  = local.region
  project = local.project
  domain  = local.domain
}

remote_state {
  backend  = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config   = {
    bucket         = "${local.project}-tf"
    key            = "terraform.tfstate"
    region         = local.region
    encrypt        = true
    dynamodb_table = "${local.project}-lock"
  }
}
