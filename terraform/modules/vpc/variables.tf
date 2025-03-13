variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC."
}

variable "public_subnet_1_cidr" {
  type        = string
  description = "CIDR block for the first public subnet."
}

variable "public_subnet_2_cidr" {
  type        = string
  description = "CIDR block for the second public subnet."
}

variable "private_subnet_1_cidr" {
  type        = string
  description = "CIDR block for the first private subnet."
}

variable "private_subnet_2_cidr" {
  type        = string
  description = "CIDR block for the second private subnet."
}

variable "availability_zone_a" {
  type        = string
  description = "Availability zone for subnets 1 (a)."
}

variable "availability_zone_b" {
  type        = string
  description = "Availability zone for subnets 2 (b)."
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