variable "eip" {
  type = object({
    ip = string
  })
}

variable "fqdn" {
  type = string
}
