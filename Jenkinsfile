pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials') // Replace with your Jenkins Docker Hub credentials ID
        DOCKER_IMAGE = 'sksupremeboss/popaye:latest' // Replace with your Docker Hub image name
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/talelekaustubh/waffle.git' // Replace with your GitHub repository
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }
    }
}
