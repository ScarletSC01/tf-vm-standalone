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

module "vm" {
  source        = "./modules/vm"
  project_id    = var.project_id
  region        = var.region
  zone          = var.zone
  instance_name = var.instance_name
  machine_type  = var.machine_type
  image         = var.image
  network       = var.network
  subnetwork    = var.subnetwork
  public_key    = var.public_key
  credentials_file = var.credentials_file
}

module "gke" {
  source        = "./modules/gke"
  project_id    = var.project_id
  region        = var.region
  cluster_name  = "jenkins-gke-cluster"
  credentials_file = var.credentials_file
}

module "cloudsql" {
  source           = "./modules/cloudsql"
  project_id       = var.project_id
  region           = var.region
  cloudsql_name    = "jenkins-postgres"
  database_version = "POSTGRES_15"
  tier             = "db-f1-micro"
  credentials_file = var.credentials_file
}
