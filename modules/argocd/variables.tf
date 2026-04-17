variable "namespace" {
  type = string
}

variable "chart_version" {
  type = string
}

variable "hostname" {
  type = string
}

variable "admin_insecure" {
  type    = bool
  default = true
}