output "repository_names" {
  value = [for r in google_artifact_registry_repository.repo : r.repository_id]
}