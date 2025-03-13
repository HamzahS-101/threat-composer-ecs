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
  description = "Docker image to use for the ECS container."
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

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs where the ECS service will be deployed."
}

variable "container_security_group_id" {
  type        = string
  description = "ID of the security group attached to the ECS container."
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the target group associated with the ECS service."
}

