
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "gke_cluster_name" {
  value = module.gke.name
}

output "artifact_registry_repositories" {
  value = module.artifact_registry.repository_names
}

output "service_account_used" {
  value = local.service_account_email
}

output "region" {
  value = var.region
}

output "project_id" {
  value = var.project_id
}

output "static_ip" {
  value = module.static_ip.address
}

output "static_ip_name" {
  value = module.static_ip.name
}