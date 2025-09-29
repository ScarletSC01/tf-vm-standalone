variable "project_id" {}
variable "region" {}
variable "zone" {}
variable "network" {}
variable "subnetwork" {}
variable "instance_name" {}
variable "machine_type" {}
variable "image" {}
variable "public_key" {}

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.credentials_file)
}

resource "google_compute_instance" "vm_example" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = var.image
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
