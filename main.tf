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
module "network" {
  source = "./modules/network"
  region = var.region
}

module "vm" {
  source        = "./modules/vm"
  project_id    = var.project_id
  region        = var.region
  zone          = var.zone
  instance_name = "jenkins-vm2"
  machine_type  = "e2-medium"
  image         = "debian-cloud/debian-12"
  public_key    = file("/var/lib/jenkins/.ssh/id_rsa.pub")
  network_id    = module.network.jenkins_network.id
  subnetwork_id = module.network.jenkins_subnet.id
  credentials_file = var.credentials_file

  depends_on = [module.network]
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
