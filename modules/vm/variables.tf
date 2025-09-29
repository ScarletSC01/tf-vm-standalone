variable "project_id" {
  description = "ID del proyecto en GCP"
  type        = string
}

variable "region" {
  description = "Región de despliegue"
  type        = string
}

variable "zone" {
  description = "Zona de la región"
  type        = string
}

variable "instance_name" {
  description = "Nombre de la instancia VM"
  type        = string
}

variable "machine_type" {
  description = "Tipo de máquina para la VM"
  type        = string
}

variable "image" {
  description = "Imagen base para la VM"
  type        = string
}

variable "network_id" {
  type = string
}

variable "subnetwork_id" {
  type = string
}


variable "public_key" {
  description = "Clave pública SSH"
  type        = string
}

variable "credentials_file" {
  description = "Ruta del archivo de credenciales"
  type        = string
}
