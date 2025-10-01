pipeline {
    agent any

    environment {
        DIR_LUCRU = "jenkins/curs"
    }
    stages {
        stage('Afiseaza director curent') {
            steps {
                script {
                    dir("${DIR_LUCRU}") {
                        sh 'pwd'
                        sh 'ls -al'
                    }
                }
            }
        }
    }
}