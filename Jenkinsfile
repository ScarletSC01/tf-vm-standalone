pipeline {
    agent any

    parameters {
        choice(
            name: 'ACTION',
            choices: ['plan', 'apply', 'destroy'],
            description: 'Seleccione acción de Terraform'
        )
    }

    environment {
        // Nombre de las credenciales subidas a Jenkins (tipo "Secret file")
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account')
        TF_VAR_project_id   = 'jenkins-terraform-demo-472920'
        TF_VAR_region       = 'us-central1'
        TF_VAR_zone         = 'us-central1-a'
        TF_VAR_network      = 'jenkins-network'
        TF_VAR_subnetwork   = 'jenkins-subnet'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ScarletSC01/tf-vm-standalone.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '/usr/local/bin/terraform init'
            }
        }

        stage('Terraform ${params.ACTION}') {
            steps {
                script {
                    if (params.ACTION == 'plan') {
                        sh '/usr/local/bin/terraform plan -var-file=terraform.tfvars'
                    } else if (params.ACTION == 'apply') {
                        sh '/usr/local/bin/terraform apply -auto-approve -var-file=terraform.tfvars'
                    } else if (params.ACTION == 'destroy') {
                        sh '/usr/local/bin/terraform destroy -auto-approve -var-file=terraform.tfvars'
                    }
                }
            }
        }
    }

    post {
        success {
            echo "¡Terraform ${params.ACTION} ejecutado con éxito!"
        }
        failure {
            echo "Ocurrió un error durante la ejecución de Terraform."
        }
    }
}
