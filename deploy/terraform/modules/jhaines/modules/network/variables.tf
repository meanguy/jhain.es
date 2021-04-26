variable "availability_zone" {
  type = string
}

variable "vpc" {
  type = object({
    vpc_id          = string
    cidr_block      = string
    ipv6_cidr_block = string
  })
}
