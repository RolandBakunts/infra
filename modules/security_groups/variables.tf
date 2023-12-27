variable "name" {
  description = "The name of Security Group."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "container_port" {
  description = "The port of ingress."
  type        = string
}