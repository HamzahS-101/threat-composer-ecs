resource "aws_route53_zone" "my_hosted_zone" {
  name = var.hosted_zone_domain
}

resource "aws_route53_record" "alb_record" {
  zone_id = aws_route53_zone.my_hosted_zone.zone_id
  name    = var.record_name
  records = [var.alb_dns_name]
  type    = "CNAME"
  ttl     = 60
}
