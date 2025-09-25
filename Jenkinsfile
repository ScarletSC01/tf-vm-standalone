pipeline {
    agent any

    environment {
        // Ruta al JSON de credenciales de GCP en la VM
        GOOGLE_CREDENTIALS = '/var/lib/jenkins/gcp/credentials.json'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/ScarletSC01/tf-vm-standalone.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '/usr/local/bin/terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh """
                    /usr/local/bin/terraform plan \
                    -var="credentials_file=$GOOGLE_CREDENTIALS" \
                    -var-file=terraform.tfvars
                """
            }
        }

        stage('Terraform Apply') {
            steps {
                sh """
                    /usr/local/bin/terraform apply -auto-approve \
                    -var="credentials_file=$GOOGLE_CREDENTIALS" \
                    -var-file=terraform.tfvars
                """
            }
        }
    }

    post {
        failure {
            echo "Ocurrió un error durante la ejecución de Terraform ❌"
        }
    }
}

