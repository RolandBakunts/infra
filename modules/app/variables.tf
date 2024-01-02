variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "name" {
  description = "Name of the task"
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

variable "container_port" {
  description = "The port on which the container will listen"
  type        = number
}

variable "alb_sg" {
  description = "List of security group IDs to assign to the load balancer."
  type        = list(string)
}

variable "ecs_sg" {
  description = "List of security group IDs to be assigned to the ECS service."
  type        = list(string)
}

variable "subnets_private" {
  description = "List of private subnet IDs where the ECS service will be deployed."
}

variable "public_subnets" {
  description = "List of subnets to associate with the load balancer."
  type        = list(object({
  id = string
  }))
}

variable "vpc_id" {
  description = "The ID of the VPC where the target group and load balancer are deployed."
  type        = string
}

variable "region" {
  type        = string
}

variable "variables" {
 type = map(string)
}

variable "secrets" {
  type = map(string)
}

variable "domain" {
  type = string
}