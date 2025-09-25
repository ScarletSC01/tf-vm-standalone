# terraform.tfvars

# Nombre del proyecto en GCP
project_id = "tu-proyecto-gcp"

# Región donde desplegarás la VM
region     = "us-central1"

# Zona dentro de la región
zone       = "us-central1-a"

# Nombre de la instancia
instance_name = "vm-jenkins-secondary"

# Tipo de máquina
machine_type = "e2-medium"

# Imagen base (ejemplo: Debian 11)
image = "debian-cloud/debian-12"

# Red y subred
network    = "default"
subnetwork = "default"

# Llave pública SSH 
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQChlYo49jMqVwpqIJTSyZt3CmSCIgicah/wa6GY4seGxQhdJZshf2Rj0Aa7fRol4CjTWjcjyPIUrx0T3/9GOageypQ6+gxOWwXgGULzdYXo2tEL/9pOZhvTdrmTTvdTsZiRxKnI9E5d4mwZs1E8WiBi+Y6CWOezrlg4inXXhjKwtB9O7lUY7A4YQAUNz5vHi65dHQUX87/I1PUYZSmZKrfGMvBD90jXZszhtlZo5RoU/46M6dhfERP5E5X2LgnIc1xexiYq790wIpEh4byAsuYNfobVP2UlWBdSuTFBld3z0gUqMtwkb6eMNkTyOSW0cW9pRSDyZjML1Uu/frDncVLF jenkins@vm-jenkins-secondary"
