variable "project_id" {
  description = "ID del proyecto en GCP"
  type        = string
}

variable "region" {
  description = "Región donde se desplegará CloudSQL"
  type        = string
}

variable "cloudsql_name" {
  description = "Nombre de la instancia CloudSQL"
  type        = string
}

variable "database_version" {
  description = "Versión de la base de datos (POSTGRES_15, etc.)"
  type        = string
}

variable "tier" {
  description = "Tier de la instancia CloudSQL"
  type        = string
}

variable "credentials_file" {
  description = "Ruta del archivo de credenciales"
  type        = string
}
