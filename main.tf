terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
  required_version = ">= 1.0"
}

provider "google" {
  project     = "jenkins-terraform-demo-472920"
  region      = var.region
  credentials = file(var.credentials_file)
}

# Módulo VM
module "vm" {
  source           = "./modules/vm"
  project_id       = var.project_id
  region           = var.region
  zone             = var.zone
  network          = var.network
  subnetwork       = var.subnetwork
  instance_name    = var.instance_name
  machine_type     = var.machine_type
  image            = var.image
  public_key       = var.public_key
  credentials_file = var.credentials_file
}

# Módulo GKE
module "gke" {
  source           = "./modules/gke"
  project_id       = var.project_id
  region           = var.region
  gke_cluster_name = var.gke_cluster_name
  credentials_file = var.credentials_file
}

# Módulo CloudSQL
module "cloudsql" {
  source           = "./modules/cloudsql"
  project_id       = var.project_id
  region           = var.region
  cloudsql_name    = var.cloudsql_name
  database_version = var.database_version
  tier             = var.tier
  credentials_file = var.credentials_file
}

