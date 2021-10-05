locals {
  aws_region  = "us-west-2"
  aws_profile = "pangu"

  ami_id        = ""
  fqdn          = "jhain.es"
  instance_type = "t3.micro"
  remote_user   = "jhaines"
  ssh_key_pair  = "jhaines"
}
