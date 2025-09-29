variable "project_id" {}
variable "region" {}
variable "zone" {}
variable "network" {}
variable "subnetwork" {}
variable "credentials_file" {}
variable "public_key" {}

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
