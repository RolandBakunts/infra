variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "name" {
  type        = string
  description = "Name of the task"
}

variable "network_mode" {
  description = "The task role"
  type        = string
}

variable "requires_compatibilities" {
  description = "The task role"
  type        = list(string)
}

variable "cpu" {
  description = "The number of CPU units used by the task"
  type        = number
}

variable "memory" {
  description = "The amount of memory used by the task"
  type        = number
}

variable "execution_role_arn" {
  description = "The execution role arn."
  type        = string
}

variable "task_role_arn" {
  description = "The task role"
  type        = string
}

variable "container_definitions" {
  type = list(object({
    environment      = any
    secrets          = any
    name             = string
    image            = string
    essential        = bool
    links            = list(string)
    volumesFrom      = list(string)
    mountPoints      = list(string)
    portMappings     = list(object({
      containerPort = number
      hostPort      = number
    }))
    logConfiguration = object({
      logDriver = string
      options   = object({
        awslogs-group         = string
        awslogs-region        = string
        awslogs-stream-prefix = string
      })
    })
  }))
  description = "A list of container definitions in JSON format used in the task definition."
}