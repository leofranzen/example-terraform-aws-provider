variable "region" {
  type        = string
  description = "The AWS region where the resources will be deployed"
}

variable "environment" {
  type        = string
  description = "The environment in which the resources will be provisioned"

  validation {
    condition     = var.environment == "dev" || var.environment == "prod"
    error_message = "Valid values for environment ex dev/prod"
  }
}
