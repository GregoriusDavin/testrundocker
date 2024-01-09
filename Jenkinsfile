pipeline {
    agent any
    
    enviroment {
    DOCKERHUB_CREDENTIALS = credentials('davingreg-dockerhub')
    }

    stages {
        stage('Check Version'){
            steps{
                sh 'docker version'
                sh 'docker compose version'
            }
        }
        stage('Login'){
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Build'){
            steps{
                sh 'docker compose build'
            }
        }    
        stage('Push'){
            steps{
                sh 'docker push davingreg/laraveldavin'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}