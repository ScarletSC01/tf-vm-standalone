pipeline {
  agent any
  parameters {
    choice(name: 'ACTION', choices: ['plan', 'apply', 'destroy'], description: 'Selecciona acción Terraform')
  }
  environment {
    TF_VAR_project_id        = "jenkins-terraform-demo-472920"
    TF_VAR_region            = "us-central1"
    TF_VAR_zone              = "us-central1-a"
    TF_VAR_credentials_file  = "C:\\Users\\scarlet.e.silva\\.gcp\\jenkins-terraform-demo-472920-bc8f093d161c.json"
    TF_VAR_network           = "jenkins-network"
    TF_VAR_subnetwork        = "jenkins-subnet"
  }
  stages {
    stage('Init Terraform') {
      steps {
        sh 'terraform init'
      }
    }
    stage('Run Terraform') {
      steps {
        script {
          if (params.ACTION == 'plan') {
            sh 'terraform plan -var-file=terraform.tfvars'
          } else if (params.ACTION == 'apply') {
            sh 'terraform apply -auto-approve -var-file=terraform.tfvars'
          } else {
            sh 'terraform destroy -auto-approve -var-file=terraform.tfvars'
          }
        }
      }
    }
  }
}
