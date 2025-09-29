# Variables para todo el proyecto
variable "project_id" {
  description = "ID del proyecto en Google Cloud"
  type        = string
}

variable "region" {
  description = "Región donde se desplegarán los recursos"
  type        = string
}

variable "zone" {
  description = "Zona de la región donde se desplegará la VM"
  type        = string
}

variable "credentials_file" {
  description = "Ruta al archivo de credenciales de servicio de GCP"
  type        = string
}

# Variables para la VM
variable "instance_name" {
  description = "Nombre de la instancia de VM"
  type        = string
}

variable "machine_type" {
  description = "Tipo de máquina para la VM"
  type        = string
}

variable "image" {
  description = "Imagen del sistema operativo para la VM"
  type        = string
}

variable "network" {
  description = "Nombre de la red de GCP"
  type        = string
}

variable "subnetwork" {
  description = "Nombre de la subred de GCP"
  type        = string
}

variable "public_key" {
  description = "Clave pública SSH para acceso a la VM"
  type        = string
}

# Variables para GKE
variable "gke_cluster_name" {
  description = "Nombre del cluster GKE"
  type        = string
}

# Variables para CloudSQL
variable "cloudsql_name" {
  description = "Nombre de la instancia CloudSQL PostgreSQL"
  type        = string
}

variable "database_version" {
  description = "Versión de la base de datos PostgreSQL"
  type        = string
}

variable "tier" {
  description = "Tipo de máquina para la instancia CloudSQL"
  type        = string
}

