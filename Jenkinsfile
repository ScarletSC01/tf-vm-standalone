pipeline {
    agent any

    environment {
        TF_VERSION = "1.7.0"
        TF_CMD = "/usr/local/bin/terraform"
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account') // Configura esto en Jenkins
    }

    parameters {
        choice(
            name: 'ACTION',
            choices: ['plan', 'apply', 'destroy'],
            description: 'Seleccione acción de Terraform'
        )
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ScarletSC01/tf-vm-standalone.git'
            }
        }

        stage('Generate terraform.tfvars') {
            steps {
                script {
                    sh """
                    echo 'project_id       = "jenkins-terraform-demo-472920"'  > terraform.tfvars
                    echo 'region           = "us-central1"'                  >> terraform.tfvars
                    echo 'zone             = "us-central1-a"'                >> terraform.tfvars
                    echo 'network          = "jenkins-network"'              >> terraform.tfvars
                    echo 'subnetwork       = "jenkins-subnet"'               >> terraform.tfvars
                    echo 'credentials_file = "${GOOGLE_APPLICATION_CREDENTIALS}"' >> terraform.tfvars
                    """
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh "${TF_CMD} init"
            }
        }

        stage('Terraform Action') {
            steps {
                script {
                    if (params.ACTION == 'plan') {
                        sh "${TF_CMD} plan -var-file=terraform.tfvars"
                    } else if (params.ACTION == 'apply') {
                        sh "${TF_CMD} apply -auto-approve -var-file=terraform.tfvars"
                    } else if (params.ACTION == 'destroy') {
                        sh "${TF_CMD} destroy -auto-approve -var-file=terraform.tfvars"
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline completado correctamente ✅"
        }
        failure {
            echo "Ocurrió un error durante la ejecución de Terraform ❌"
        }
    }
}
