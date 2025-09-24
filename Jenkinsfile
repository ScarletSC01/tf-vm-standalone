pipeline {
    agent any

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = '/var/lib/jenkins/keys/jenkins-terraform.json'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ScarletSC01/tf-vm-standalone.git'
            }
        }

        stage('Generate SSH Key if Missing') {
            steps {
                script {
                    if (!fileExists("${env.HOME}/.ssh/id_rsa")) {
                        sh 'ssh-keygen -t rsa -b 2048 -f ${HOME}/.ssh/id_rsa -N ""'
                    }
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh '/usr/local/bin/terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '/usr/local/bin/terraform plan -var-file=terraform.tfvars'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '/usr/local/bin/terraform apply -auto-approve -var-file=terraform.tfvars'
            }
        }
    }

    post {
        success {
            echo 'Terraform applied successfully ✅'
        }
        failure {
            echo 'Ocurrió un error durante la ejecución de Terraform ❌'
        }
    }
}

