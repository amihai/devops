pipeline {
    agent any

    environment {
        DIR_LUCRU = "jenkins/curs"
        IMAGE_NAME = "andreimihai/curs-app"
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
    }
}