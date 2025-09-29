provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.credentials_file)
}

resource "google_sql_database_instance" "postgres" {
  name             = var.cloudsql_name
  database_version = var.database_version
  region           = var.region

  settings {
    tier = var.tier
    ip_configuration {
      ipv4_enabled = true
      authorized_networks {
        name  = "all"
        value = "0.0.0.0/0"
      }
    }
  }
}

resource "google_sql_user" "postgres_user" {
  name     = "admin"
  instance = google_sql_database_instance.postgres.name
  password = "1234"
}
