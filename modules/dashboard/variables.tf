variable "name" {
  description = "The name of the CloudWatch dashboard."
  type        = string
}

variable "environment" {
  description = "The deployment environment for the dashboard."
  type        = string
}

variable "service_name" {
  description = "The name of the ECS service."
  type        = string
}

variable "cluster_name" {
  description = "The name of the ECS cluster."
  type        = string
}

variable "region" {
  description = "The AWS region for the CloudWatch dashboard."
  type        = string
}

variable "target_group_arn" {
  description = "The ARN of the target group associated with the load balancer."
  type        = string
}

variable "alb_arn" {
  description = "The ARN of the Application Load Balancer."
  type        = string
}
