variable "name" {
  description = "Name for the load balancer"
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "security_groups" {
  description = "List of security group IDs to assign to the load balancer."
  type        = list(string)
}

variable "subnets" {
  description = "List of subnets to associate with the load balancer."
  type        = list(object({
  id = string
  }))
}

variable "vpc_id" {
  description = "The ID of the VPC where the target group and load balancer are deployed."
  type        = string
}

variable "health_check_path" {
  type        = string
  description = "Path used to check the health of the targets."
}