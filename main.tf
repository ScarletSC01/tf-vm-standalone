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
  project     = var.project_id
  region      = var.region
  credentials = file(var.credentials_file)
}
variable "network" {
  description = "Nombre de la red de GCP"
  type        = string
}

variable "subnetwork" {
  description = "Nombre de la subred de GCP"
  type        = string
}

variable "image" {
  description = "Imagen del sistema operativo para la VM"
  type        = string
}


resource "google_compute_instance" "vm_example" {
  name         = "vm-jenkins-secondary"
  machine_type = "n1-standard-2"
  zone         = var.zone
  allow_stopping_for_update = true 

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 20
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    access_config {}
  }

  metadata = {
    ssh-keys = "user=${var.public_key}"
  }

  tags = ["jenkins-vm"]
}

