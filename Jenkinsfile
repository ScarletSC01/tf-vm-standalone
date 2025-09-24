pipeline {
    agent any

    environment {
        TF_CMD = "/usr/local/bin/terraform"
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account') // Credencial en Jenkins
        SSH_KEY_PATH = "id_rsa.pub"
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

        stage('Generate SSH Key if Missing') {
            steps {
                script {
                    if (!fileExists(SSH_KEY_PATH)) {
                        sh '''
                        ssh-keygen -t rsa -b 2048 -f id_rsa -q -N ""
                        '''
                    }
                }
            }
        }

        stage('Generate terraform.tfvars') {
            steps {
                script {
                    writeFile file: 'terraform.tfvars', text: """
                        project_id       = "jenkins-terraform-demo-472920"
                        region           = "us-central1"
                        zone             = "us-central1-a"
                        network          = "jenkins-network"
                        subnetwork       = "jenkins-subnet"
                        credentials_file = "${GOOGLE_APPLICATION_CREDENTIALS}"
                        public_key       = "${SSH_KEY_PATH}"
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
