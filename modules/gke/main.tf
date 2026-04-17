resource "google_container_cluster" "gke" {
  name     = var.name
  location = var.region

  network    = var.network
  subnetwork = var.subnetwork

  enable_autopilot = true
  deletion_protection = false

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  release_channel {
    channel = "REGULAR"
  }
}