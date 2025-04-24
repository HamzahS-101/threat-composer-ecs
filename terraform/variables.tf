# VPC
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC."
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets."
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets."
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones to use."
}

variable "alb_sg_name" {
  type        = string
  description = "Name of the Application Load Balancer security group."
}

variable "alb_sg_description" {
  type        = string
  description = "Description of the Application Load Balancer security group."
}

variable "container_sg_name" {
  type        = string
  description = "Name of the ECS container security group."
}

variable "container_sg_description" {
  type        = string
  description = "Description of the ECS container security group."
}

variable "container_ingress_port" {
  type        = number
  description = "Port number for container ingress traffic."
}

variable "region" {
  type        = string
  description = "AWS region to deploy resources in."
}


# Security Groups

variable "alb_sg_name" {
  type        = string
  description = "Name of the Application Load Balancer security group."
}

variable "alb_sg_description" {
  type        = string
  description = "Description of the Application Load Balancer security group."
}

variable "container_sg_name" {
  type        = string
  description = "Name of the ECS container security group."
}

variable "container_sg_description" {
  type        = string
  description = "Description of the ECS container security group."
}

variable "container_ingress_port" {
  type        = number
  description = "Port number for container ingress traffic."
}

# ALB and target group

variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer."
}

variable "target_group_name" {
  type        = string
  description = "Name of the target group for the ALB."
}

variable "target_group_port" {
  type        = number
  description = "Port number for the target group."
}

variable "target_group_protocol" {
  type        = string
  description = "Protocol for the target group (e.g., HTTP, HTTPS)."
}

# Route53

variable "domain_name" {
  type        = string
  description = "Domain name for the ACM certificate (e.g., app.example.com)."
}

variable "hosted_zone_domain" {
  type        = string
  description = "Domain name of the Route53 hosted zone (e.g., example.com)."
}

variable "record_name" {
  type        = string
  description = "Name of the Route53 record (e.g., app)."
}

# ECS

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster."
}

variable "iam_role_name" {
  type        = string
  description = "Name of the IAM role for ECS tasks."
}

variable "iam_policy_name" {
  type        = string
  description = "Name of the IAM policy for ECS tasks."
}

variable "task_definition_family" {
  type        = string
  description = "Family name for the ECS task definition."
}

variable "task_cpu" {
  type        = number
  description = "CPU units for the ECS task."
}

variable "task_memory" {
  type        = number
  description = "Memory (MiB) for the ECS task."
}

variable "container_name" {
  type        = string
  description = "Name of the container in the ECS task definition."
}

variable "docker_image" {
  type        = string
  description = "Docker image to use for the ECS container (ECR repository URI)"
}

variable "container_cpu" {
  type        = number
  description = "CPU units for the ECS container."
}

variable "container_memory" {
  type        = number
  description = "Memory (MiB) for the ECS container."
}

variable "container_port" {
  type        = number
  description = "Port number the container listens on."
}

variable "service_name" {
  type        = string
  description = "Name of the ECS service."
}

variable "desired_count" {
  type        = number
  description = "Desired number of tasks to run in the ECS service."
}

