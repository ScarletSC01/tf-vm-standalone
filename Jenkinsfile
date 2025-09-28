```groovy
pipeline {
    agent any

    parameters {
        choice(
            name: 'ACTION',
            choices: ['plan', 'apply', 'destroy'],
            description: 'Selecciona la acción de Terraform'
        )
    }

    environment {
        GOOGLE_APPLICATION_CREDENTIALS = "/var/lib/jenkins/gcp/credentials.json"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/ScarletSC01/tf-vm-standalone.git', branch: 'main'
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                  terraform init \
                    -var=credentials_file=${GOOGLE_APPLICATION_CREDENTIALS}
                '''
            }
        }

        stage('Terraform Import VM') {
            steps {
                sh '''
                  terraform import \
                    -var=credentials_file=${GOOGLE_APPLICATION_CREDENTIALS} \
                    google_compute_instance.vm_example \
                    projects/jenkins-terraform-demo-472920/zones/us-central1-a/instances/vm-jenkins-secondary || true
                '''
            }
        }

        stage('Terraform Plan') {
            when {
                expression { params.ACTION == 'plan' }
            }
            steps {
                sh '''
                  terraform plan \
                    -var=credentials_file=${GOOGLE_APPLICATION_CREDENTIALS} \
                    -var-file=terraform.tfvars
                '''
            }
        }

        stage('Terraform Apply') {
            when {
                expression { params.ACTION == 'apply' }
            }
            options {
                timeout(time: 20, unit: 'MINUTES')
            }
            steps {
                sh '''
                  terraform apply -auto-approve \
                    -var=credentials_file=${GOOGLE_APPLICATION_CREDENTIALS} \
                    -var-file=terraform.tfvars
                '''
            }
        }

        stage('Terraform Destroy') {
            when {
                expression { params.ACTION == 'destroy' }
            }
            steps {
                sh '''
                  terraform destroy -auto-approve \
                    -var=credentials_file=${GOOGLE_APPLICATION_CREDENTIALS} \
                    -var-file=terraform.tfvars
                '''
            }
        }
    }
}
```

