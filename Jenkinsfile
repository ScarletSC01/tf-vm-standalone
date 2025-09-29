pipeline {
    agent any
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
                sh 'terraform plan -var=credentials_file=$GOOGLE_APPLICATION_CREDENTIALS -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve -var=credentials_file=$GOOGLE_APPLICATION_CREDENTIALS'
            }
        }
        stage('Terraform Destroy') {
            when {
                expression { return params.DESTROY == true }
            }
            steps {
                sh 'terraform destroy -auto-approve -var=credentials_file=$GOOGLE_APPLICATION_CREDENTIALS'
            }
        }
    }
}


