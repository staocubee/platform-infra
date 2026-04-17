variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "repositories" {
  description = "Artifact Registry repositories"
  type        = list(string)
}

variable "service_account_email" {
  description = "Service account to grant access"
  type        = string
}