variable "project_id" {}
variable "region" { default = "us-central1" }
variable "zone" { default = "us-central1-a" }
variable "credentials_file" {}
variable "network" {}
variable "subnetwork" {}
variable "public_key" {
  description = "Clave pública SSH para acceder a la VM"
  type        = string
}
