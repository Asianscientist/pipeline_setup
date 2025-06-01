pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        TF_IN_AUTOMATION      = "true"
    }
    stages {
        stage("Terraform init and apply"){
            steps {
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        stage('Configure with Ansible'){
            steps {
                sshagent (credentials: ['my-ec2-key']) {
                    sh '''
                        ansible-playbook -i inventory.ini ansible/playbook.yml
                    '''
                }
            }
        }
    }
    post {
        success {
            echo 'Fastapi app deployed successfully'
        }
        failure {
            echo 'Deployment failed'
        }
    }
}
