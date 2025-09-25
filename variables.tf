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

variable "instance_name" {
  description = "Nombre de la instancia de VM"
  type        = string
}

variable "machine_type" {
  description = "Tipo de máquina para la VM"
  type        = string
}

variable "public_key" {
  description = "Clave pública SSH para acceso a la VM"
  type        = string
}

