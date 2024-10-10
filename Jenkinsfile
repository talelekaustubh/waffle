pipeline {
    agent any

    environment {
        // Docker Hub credentials (stored in Jenkins credentials)
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials')
        
        // Docker image details
        IMAGE_NAME = 'sksupremeboss/popaye'
        DOCKERFILE_DIR = '.'  // Directory where your Dockerfile is located (root of your repo)
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Pull the code from your GitHub repository
                git url: 'https://github.com/talelekaustubh/waffle.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image using the Dockerfile
                script {
                    docker.build("${IMAGE_NAME}:latest", "${DOCKERFILE_DIR}")
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Log in to Docker Hub using the credentials stored in Jenkins
                    docker.withRegistry('https://index.docker.io/v1/', docker-hub-credentials) {
                        echo 'Logged in to Docker Hub'
                    }
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Push the built image to Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', docker-hub-credentials) {
                        docker.image("${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace after the pipeline completes
            cleanWs()
        }
    }
}
