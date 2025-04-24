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
