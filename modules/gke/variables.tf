variable "project_id" {
  description = "ID del proyecto en GCP"
  type        = string
}

variable "region" {
  description = "Región donde se desplegará el cluster"
  type        = string
}

variable "cluster_name" {
  description = "Nombre del cluster GKE"
  type        = string
}

variable "credentials_file" {
  description = "Ruta del archivo de credenciales"
  type        = string
}
