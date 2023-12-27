variable "region" {
  description = "aws region"
  type        = string
}

variable "cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "environment" {
  description = "The environment."
  type        = string
}

variable "project" {
  description = "The project name."
  type        = string
}

variable "container_port" {
  description = "The port of ingress."
  type        = string
}

variable "task_cpu" {
  description = "The number of CPU units used by the task"
  type        = number
}

variable "task_memory" {
  description = "The amount of memory used by the task (in MiB)"
  type        = number
}

variable "image" {
  description = "The Docker image to use for the container"
  type        = string
}

variable "secrets" {
  type = map(string)
}
