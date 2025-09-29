# terraform.tfvars

# Nombre del proyecto en GCP
project_id = "jenkins-terraform-demo-472920"

# Región donde desplegarás los recursos
region     = "us-central1"

# Zona dentro de la región
zone       = "us-central1-a"

# VM 
instance_name = "vm-jenkins-secondary"
machine_type  = "e2-medium"
image         = "debian-cloud/debian-12"
network       = "jenkins-network"
subnetwork    = "jenkins-subnet"

# Llave pública SSH para VM
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQChlYo49jMqVwpqIJTSyZt3CmSCIgicah/wa6GY4seGxQhdJZshf2Rj0Aa7fRol4CjTWjcjyPIUrx0T3/9GOageypQ6+gxOWwXgGULzdYXo2tEL/9pOZhvTdrmTTvdTsZiRxKnI9E5d4mwZs1E8WiBi+Y6CWOezrlg4inXXhjKwtB9O7lUY7A4YQAUNz5vHi65dHQUX87/I1PUYZSmZKrfGMvBD90jXZszhtlZo5RoU/46M6dhfERP5E5X2LgnIc1xexiYq790wIpEh4byAsuYNfobVP2UlWBdSuTFBld3z0gUqMtwkb6eMNkTyOSW0cW9pRSDyZjML1Uu/frDncVLF jenkins@vm-jenkins-secondary"

# GKE 
gke_cluster_name = "gke-cluster-demo"

# CloudSQL 
cloudsql_name     = "cloudsql-postgres-demo"
database_version  = "POSTGRES_15"
tier              = "db-f1-micro"
