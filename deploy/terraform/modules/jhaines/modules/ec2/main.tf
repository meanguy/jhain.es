data "aws_caller_identity" "current" {}

data "aws_ami" "ami" {
  count = var.ami_id == "" ? 1 : 0

  most_recent = true

  owners = [data.aws_caller_identity.current.id]

  filter {
    name = "tag:Service"
    values = ["jhaines"]
  }
}

resource "aws_network_interface" "nic" {
  security_groups = var.security_group_ids
  subnet_id       = var.subnet.subnet_id
}

resource "aws_eip" "eip" {
  network_interface = aws_network_interface.nic.id

  public_ipv4_pool = "amazon"
  vpc              = true
}

resource "aws_instance" "instance" {
  ami           = var.ami_id == "" ? data.aws_ami.ami.0.id : var.ami_id
  instance_type = var.instance_type
  key_name      = var.ssh_key_pair

  monitoring = true

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.nic.id
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "jhaines-webserver"
  }
}
