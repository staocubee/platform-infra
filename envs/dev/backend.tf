terraform {
  backend "gcs" {
    bucket                      = "infra-setup-state-bucket"
    prefix                      = "infra-setup/dev"
    impersonate_service_account = "techbeingsa@project-6a06b82f-4814-4b4c-b83.iam.gserviceaccount.com"
  }
}