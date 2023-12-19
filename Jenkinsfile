pipeline {
    agent any
    environment{
        DOCKER_HUB_LOGIN = credentials('docker')
        REGISTRY = "roxsross12"
    }
    stages {
        stage('docker build') {
            steps {
               sh 'docker build -t prueba-node:v1 .'
            }
        }
        stage('Deploy to hub') {
            steps {
                sh '''
                docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW
                docker tag prueba-node:v1 $REGISTRY/prueba-node:v1
                docker push $REGISTRY/prueba-node:v1
                '''
            }
        }
    }
}