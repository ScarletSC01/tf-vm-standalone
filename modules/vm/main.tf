
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
  network    = var.network_id       # ahora pasamos el ID de la red
  subnetwork = var.subnetwork_id    # ahora pasamos el ID de la subred
  access_config {}
}

  metadata = {
    ssh-keys = "user=${var.public_key}"
  }

  tags = ["jenkins-vm"]
}

