resource "google_artifact_registry_repository" "repo" {
  for_each = toset(var.repositories)

  location      = var.region
  repository_id = each.value
  format        = "DOCKER"
}