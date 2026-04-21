variable "region" {
  default = "us-central1"
}
variable "project_id" {
  type = string
}
variable "service_account_email" {
  type        = string
  description = "The email of the service account"
}
variable "artifact_repositories" {
  description = "List of Artifact Registry repositories"
  type        = list(string)
}

variable "admin_insecure" {
  type    = bool
  default = true
}

