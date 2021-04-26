terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile = local.aws_profile
  region  = local.aws_region
}

module "jhaines" {
  source = "./modules/jhaines"

  aws_region = local.aws_region
  fqdn       = local.fqdn

  ami_id        = local.ami_id
  instance_type = local.instance_type
  remote_user   = local.remote_user
  ssh_key_pair  = local.ssh_key_pair
}
