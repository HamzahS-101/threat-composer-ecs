output "hosted_zone_id" {
  value = aws_route53_zone.my_hosted_zone.zone_id
}

output "acm_certificate_arn" {
  value = aws_acm_certificate_validation.cert_validation.certificate_arn
}