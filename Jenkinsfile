pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/rajeshbuece/PYTHON-Application-groovy.git' // Use your repo URL
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    withSonarQubeEnv('SonarQubeServer') { // Set SonarQube server details
                        sh 'sonar-scanner -Dsonar.projectKey=flask-app -Dsonar.sources=. -Dsonar.python.version=3.8'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('flask-app')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('flask-app').run('-p 5000:5000')
                }
            }
        }

        stage('Post Analysis') {
            steps {
                // Wait for SonarQube analysis result
                script {
                    timeout(time: 1, unit: 'HOURS') {
                        waitForQualityGate abortPipeline: true
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline Completed'
        }
    }
}

