data "aws_route53_zone" "zone" {
  name = var.fqdn
}

resource "aws_route53_record" "root" {
  zone_id = data.aws_route53_zone.zone.zone_id

  name = var.fqdn
  type = "A"
  ttl = "300"
  records = [var.eip.ip]
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.zone.zone_id

  name = "www.${var.fqdn}"
  type = "CNAME"
  ttl = "300"
  records = [var.fqdn]
}
