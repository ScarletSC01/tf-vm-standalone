resource "google_compute_network" "jenkins_network" {
  name                    = "jenkins-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "jenkins_subnet" {
  name          = "jenkins-subnet"
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  network       = google_compute_network.jenkins_network.id
}
