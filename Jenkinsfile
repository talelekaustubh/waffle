// pipeline {
//     agent any

//     environment {
//         DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials') // Replace with your Jenkins Docker Hub credentials ID
//         DOCKER_IMAGE = 'sksupremeboss/popaye:latest' // Replace with your Docker Hub image name
//     }

//     stages {
//         stage('Clone Repository') {
//             steps {
//                 git branch: 'main', url: 'https://github.com/talelekaustubh/waffle.git' // Use 'main' branch explicitly
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     sh 'docker build -t $DOCKER_IMAGE .'
//                 }
//             }
//         }

//         stage('Login to Docker Hub') {
//             steps {
//                 script {
//                     sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
//                 }
//             }
//         }

//         stage('Push Docker Image to Docker Hub') {
//             steps {
//                 script {
//                     sh 'docker push $DOCKER_IMAGE'
//                 }
//             }
//         }
//     }
// }

pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials')
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/talelekaustubh/waffle.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t sksupremeboss/popaye:latest .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    sh "echo ${DOCKERHUB_CREDENTIALS_PSW} | docker login -u ${DOCKERHUB_CREDENTIALS_USR} --password-stdin"
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                sh 'docker push sksupremeboss/popaye:latest'
            }
        }
    }

    post {
        success {
            emailext(
                subject: 'SUCCESS: Jenkins Pipeline Job [${JOB_NAME}]',
                body: 'The pipeline has completed successfully. Build Number: ${BUILD_NUMBER}. Check details at ${BUILD_URL}',
                to: 'kaustubhtu@gmail.com'
            )
        }

        failure {
            emailext(
                subject: 'FAILURE: Jenkins Pipeline Job [${JOB_NAME}]',
                body: 'The pipeline has failed. Build Number: ${BUILD_NUMBER}. Check details at ${BUILD_URL}',
                to: 'kaustubhtu@gmail.com'
            )
        }
    }
}
