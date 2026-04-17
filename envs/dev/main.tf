provider "google" {
  project = var.project_id
  region  = var.region
}

locals {
  service_account_email = var.service_account_email
}

# -------------------------
# VPC
# -------------------------
module "vpc" {
  source = "../../modules/vpc"

  name          = "dev-vpc"
  region        = var.region
  subnet_cidr   = "10.10.0.0/16"
  pods_cidr     = "10.20.0.0/16"
  services_cidr = "10.30.0.0/16"
}

# -------------------------
# GKE
# -------------------------
module "gke" {
  source = "../../modules/gke"

  name       = "dev-gke"
  region     = var.region
  project_id = var.project_id
  network    = module.vpc.vpc_id
  subnetwork = module.vpc.subnet_id
}

# -------------------------
# Artifact Registry (CREATE)
# -------------------------
module "artifact_registry" {
  source = "../../modules/artifact-registry"
  region       = var.region
  repositories = ["dev-repo"]
}

# -------------------------
# Artifact Registry IAM (ACCESS)
# -------------------------
module "artifact_registry_iam" {
  source = "../../modules/artifact-registry-iam"

  project_id            = var.project_id
  region                = var.region
  repositories          = module.artifact_registry.repository_names
  service_account_email = local.service_account_email
}

# -------------------------
# Project IAM
# -------------------------
module "iam" {
  source = "../../modules/iam"
  project_id            = var.project_id
  service_account_email = local.service_account_email
}

provider "kubernetes" {
  config_path = pathexpand("~/.kube/config")
}

provider "helm" {
  kubernetes = {
    config_path = pathexpand("~/.kube/config")
  }
}

module "argocd" {
  source = "../../modules/argocd"

  chart_version   = var.argocd_chart_version
  namespace       = var.argocd_namespace
  hostname        = var.argocd_hostname
  admin_insecure  = true
}

module "static_ip" {
  source = "../../modules/static-ip"
  name   = "dev-platform-ip"
  region = var.region
  project_id = var.project_id
}