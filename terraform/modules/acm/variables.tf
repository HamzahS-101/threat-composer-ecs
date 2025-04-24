variable "domain_name" {
  type        = string
  description = "Domain name for the ACM certificate (e.g., app.example.com)."
}

variable "hosted_zone_id" {
  type        = string
  description = "Route53 hosted zone ID."
}
