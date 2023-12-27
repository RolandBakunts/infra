variable "name" {
  description = "Base name for the ECS service."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "cluster_id" {
  description = "ID of the ECS cluster where the service will be deployed."
  type        = string
}

variable "task_definition_arn" {
  description = "ARN of the task definition that the service will run."
  type        = string
}

variable "desired_count" {
  description = "The number of instances of the task definition to place and keep running."
  type        = number
}

variable "min_percent" {
  description = "Minimum healthy percent for ECS service deployment."
  type        = number
}

variable "max_percent" {
  description = "Maximum percent of ECS service deployment."
  type        = number
}

variable "launch_type" {
  description = "The launch type on which to run your service."
  type        = string
}

variable "scheduling_strategy" {
  description = "The scheduling strategy to use for the service."
  type        = string
}

variable "security_groups" {
  description = "The security groups associated with the task or service."
  type        = list(string)
}

variable "subnets" {
  description = "The subnets associated with the task or service. Each subnet should be specified as an object with an 'id' attribute."
}

variable "aws_alb_target_group_arn" {
  description = "ARN of the target group with which to register the service's load balancer."
  type        = string
}

variable "container_name" {
  description = "The name of the container to associate with the load balancer."
  type        = string
}

variable "container_port" {
  description = "The port on the container to associate with the load balancer."
  type        = number
}

variable "enable_execute_command" {
  type        = string
}

