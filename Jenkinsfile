pipeline {
    agent any
    parameters {
        booleanParam(name: 'DESTROY', defaultValue: false, description: 'Marcar true para destruir todos los recursos')
    }
    environment {
        GOOGLE_APPLICATION_CREDENTIALS = '/var/lib/jenkins/gcp/credentials.json'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ScarletSC01/tf-vm-standalone.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init -var=credentials_file=$GOOGLE_APPLICATION_CREDENTIALS'
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    if (!params.DESTROY) {
                        sh 'terraform plan -var=credentials_file=$GOOGLE_APPLICATION_CREDENTIALS -out=tfplan'
                    } else {
                        echo "Skipping plan because DESTROY is true"
                    }
                }
            }
        }
        stage('Terraform Apply') {
            when {
                expression { return !params.DESTROY }
            }
            steps {
                sh 'terraform apply -auto-approve -var=credentials_file=$GOOGLE_APPLICATION_CREDENTIALS'
            }
        }
        stage('Terraform Destroy') {
            when {
                expression { return params.DESTROY }
            }
            steps {
                sh 'terraform destroy -auto-approve -var=credentials_file=$GOOGLE_APPLICATION_CREDENTIALS'
            }
        }
    }
    post {
        always {
            echo 'Pipeline finished'
        }
    }
}



