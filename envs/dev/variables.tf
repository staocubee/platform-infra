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

variable "argocd_namespace" {
  type    = string
  default = "argocd"
}

variable "argocd_chart_version" {
  type    = string
  default = "7.8.2"
}

variable "argocd_hostname" {
  type = string
}
variable "admin_insecure" {
  type    = bool
  default = true
}

