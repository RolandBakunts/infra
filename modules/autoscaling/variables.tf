
variable "cluster_name" {
  description = "The name of the cluster."
  type        = string
}

variable "service_name" {
  description = "The name of the service."
  type        = string
}

variable "cpu_average_target" {
  description = "The average CPU utilization percentage to target for autoscaling."
  type        = number
}

variable "memory_average_target" {
  description = "The average memory utilization percentage to target for autoscaling."
  type        = number
}

variable "scale_in_cooldown" {
  description = "Cooldown period in seconds before further scale in actions can be executed after one has completed."
  type        = number
}

variable "scale_out_cooldown" {
  description = "Cooldown period in seconds before further scale out actions can be executed after one has completed."
  type        = number
}

variable "max_capacity" {
  description = "The maximum number of instances the autoscaling group can scale out to."
  type        = number
}

variable "min_capacity" {
  description = "The minimum number of instances the autoscaling group can scale in to."
  type        = number
}
