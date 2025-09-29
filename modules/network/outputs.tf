output "network_id" {
  value = google_compute_network.jenkins_network.id
  description = "ID de la red VPC"
}

output "subnetwork_id" {
  value = google_compute_subnetwork.jenkins_subnet.id
  description = "ID de la subred"
}
