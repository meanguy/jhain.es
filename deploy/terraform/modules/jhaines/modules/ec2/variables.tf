variable "ami_id" {
  type = string
}

variable "fqdn" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "ssh_key_pair" {
  type = string
}

variable "subnet" {
  type = object({
    subnet_id = string
  })
}
