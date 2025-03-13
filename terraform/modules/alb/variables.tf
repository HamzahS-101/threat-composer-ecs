variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer."
}

variable "alb_security_group_id" {
  type        = string
  description = "ID of the security group attached to the Application Load Balancer."
}

variable "alb_subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs where the Application Load Balancer will be deployed."
}

variable "target_group_name" {
  type        = string
  description = "Name of the target group associated with the Application Load Balancer."
}

variable "target_group_port" {
  type        = number
  description = "Port number for the target group."
}

variable "target_group_protocol" {
  type        = string
  description = "Protocol used by the target group (e.g., HTTP, HTTPS)."
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC where the Application Load Balancer and target group reside."
}

variable "acm_certificate_arn" {
  type        = string
  description = "ARN of the ACM certificate to be used with the Application Load Balancer."
}



