module "vpc" {
  source = "./modules/vpc"
}

module "network" {
  source = "./modules/network"

  vpc = module.vpc.vpc

  availability_zone = "${var.aws_region}a"
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc = module.vpc.vpc

  aws_region = var.aws_region
}

module "ec2" {
  source = "./modules/ec2"

  security_group_ids = module.security_groups.security_group_ids
  subnet             = module.network.subnet

  ami_id        = var.ami_id
  fqdn          = var.fqdn
  instance_type = var.instance_type
  ssh_key_pair  = var.ssh_key_pair
}

module "route53" {
  source = "./modules/route53"

  eip = module.ec2.eip

  fqdn = var.fqdn
}
