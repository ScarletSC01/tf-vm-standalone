pipeline {
    agent any
    parameters {
        choice(
            name: 'ACTION',
            choices: ['plan', 'apply', 'destroy'],
            description: 'Selecciona la acción de Terraform a ejecutar'
        )
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
                echo "Inicializando Terraform y cargando módulos..."
                sh 'terraform init -var=credentials_file=$GOOGLE_APPLICATION_CREDENTIALS'
            }
        }
        stage('Terraform Plan') {
            when {
                expression { return params.ACTION == 'plan' }
            }
            steps {
                echo "Generando plan de Terraform para todos los módulos (VM, GKE, CloudSQL)..."
                sh 'terraform plan -var=credentials_file=$GOOGLE_APPLICATION_CREDENTIALS -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            when {
                expression { return params.ACTION == 'apply' }
            }
            steps {
                echo "Aplicando Terraform: creando VM, GKE y CloudSQL..."
                sh 'terraform apply -auto-approve -var=credentials_file=$GOOGLE_APPLICATION_CREDENTIALS'
            }
        }
        stage('Terraform Destroy') {
            when {
                expression { return params.ACTION == 'destroy' }
            }
            steps {
                echo "Destruyendo todos los recursos Terraform: VM, GKE y CloudSQL..."
                sh 'terraform destroy -auto-approve -var=credentials_file=$GOOGLE_APPLICATION_CREDENTIALS'
            }
        }
    }
    post {
        always {
            echo 'Pipeline finalizado'
        }
    }
}

