locals {
  service_account_email = var.service_account_email
}

module "artifact_registry_iam" {
  source  = "terraform-google-modules/iam/google//modules/artifact_registry_iam"
  version = "~> 8.2"

  project      = var.project_id
  location     = var.region
  repositories = var.repositories

  mode = "additive"

  bindings = {
    "roles/artifactregistry.writer" = [
      "serviceAccount:${local.service_account_email}"
    ]
  }
}