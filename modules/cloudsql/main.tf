variable "project_id" {}
variable "region" {}
variable "instance_name" {}
variable "database_version" {}
variable "tier" {}

resource "google_sql_database_instance" "postgres_instance" {
  name             = var.instance_name
  region           = var.region
  database_version = var.database_version

  settings {
    tier = var.tier
  }
}
