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

# -----------------------------
# Variables necesarias
# -----------------------------
variable "project_id" {
  description = "ID del proyecto en GCP"
  type        = string
}

variable "region" {
  description = "Región donde se crean los recursos"
  type        = string
}

variable "zone" {
  description = "Zona donde se crean los recursos"
  type        = string
}

variable "network" {
  description = "Nombre de la red"
  type        = string
}

variable "subnetwork" {
  description = "Nombre de la subred"
  type        = string
}

variable "credentials_file" {
  description = "Ruta del archivo de credenciales de GCP"
  type        = string
}

variable "public_key" {
  description = "Ruta del archivo con la clave pública SSH"
  type        = string
}

# -----------------------------
# Recurso: VM en GCP
# -----------------------------
resource "google_compute_instance" "vm_example" {
  name         = "vm-jenkins-secondary"
  machine_type = "e2-medium"
  zone         = var.zone

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

  # Se parametriza la clave pública
  metadata = {
    ssh-keys = "user:${file(var.public_key)}"
  }

  tags = ["jenkins-vm"]
}

