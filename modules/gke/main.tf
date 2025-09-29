variable "project_id" {}
variable "region" {}
variable "cluster_name" {}

resource "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1
}
