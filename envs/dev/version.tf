terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.00"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }
    # Be very strict here to get off that v3.3.1 version
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.0" 
    }
  }
}