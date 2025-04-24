variable "hosted_zone_domain" {
  type        = string
  description = "Domain name of the Route53 hosted zone (e.g., example.com)."
}

variable "record_name" {
  type        = string
  description = "Name of the Route53 record (e.g., app)."
}

variable "alb_dns_name" {
  type        = string
  description = "DNS name of the Application Load Balancer."
}
