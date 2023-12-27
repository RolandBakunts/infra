variable "name" {
  description = "The base name for the CloudWatch log group."
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., 'prod', 'dev', 'staging')."
  type        = string
}

variable "retention_in_days" {
  description = "The number of days to retain log events in the log group."
  type        = number
}
