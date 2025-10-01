pipeline {
    agent any

    environment {
        DIR_LUCRU = "jenkins/curs"
        DOCKERHUB_CREDENTIALS_ID = "dockerhub-creds-id"
        DOCKERHUB_CREDENTIALS = credentials("${DOCKERHUB_CREDENTIALS_ID}")
        IMAGE_NAME = "${DOCKERHUB_CREDENTIALS_USR}/curs-app"
        TAG = "${BUILD_NUMBER}"
    }
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    dir("${DIR_LUCRU}") {
                        dockerImage = docker.build("${IMAGE_NAME}:${TAG}")
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKERHUB_CREDENTIALS_ID}") {
                        dockerImage.push()
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}