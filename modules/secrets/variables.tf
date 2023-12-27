variable "secrets" {
  description = "A map of secrets where each key-value pair represents a secret's name and its content."
  type        = map(string)
}

variable "name" {
  description = "The base name for the secrets."
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., 'prod', 'dev', 'staging')."
  type        = string
}
