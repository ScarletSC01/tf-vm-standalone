pipeline {
    agent any

    parameters {
        choice(name: 'ACTION', choices: ['plan', 'apply', 'destroy'], description: 'Seleccione acción de Terraform')
    }

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account')
        TF_VAR_project_id  = 'jenkins-terraform-demo-472920'
        TF_VAR_region      = 'us-central1'
        TF_VAR_zone        = 'us-central1-a'
        TF_VAR_network     = 'jenkins-network'
        TF_VAR_subnetwork  = 'jenkins-subnet'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ScarletSC01/tf-vm-standalone.git'
            }
        }

        stage('Generate terraform.tfvars') {
            steps {
                sh '''
                echo "project_id  = \\"${TF_VAR_project_id}\\""  > terraform.tfvars
                echo "region      = \\"${TF_VAR_region}\\""     >> terraform.tfvars
                echo "zone        = \\"${TF_VAR_zone}\\""       >> terraform.tfvars
                echo "network     = \\"${TF_VAR_network}\\""    >> terraform.tfvars
                echo "subnetwork  = \\"${TF_VAR_subnetwork}\\"" >> terraform.tfvars
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh '/usr/local/bin/terraform init'
            }
        }

        stage('Terraform Action') {
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
        failure {
            echo "Ocurrió un error durante la ejecución de Terraform."
        }
        success {
            echo "Terraform ejecutado exitosamente con la acción: ${params.ACTION}"
        }
    }
}

