pipeline {
    agent any
    environment{
        DOCKER_HUB_LOGIN = credentials('docker')
        REGISTRY = "roxsross12"
        IMAGE = 'prueba-node'
    }
    stages {

        stage('init') {
            agent {
                docker {
                    image 'node:alpine'
                    arg '-u root:root'
                }
            }
            steps {
               sh 'npm install'
            }
        } 
        stage('test') {
            agent {
                docker {
                    image 'node:alpine'
                    arg '-u root:root'
                }
            }
            steps {
               sh 'npm run test'
            }
        }                 
        stage('docker build') {
            steps {
               sh '''
                VERSION=$(jq --raw-output .version package.json)
                echo $VERSION >version.txt
                docker build -t $IMAGE:$(cat version.txt) .
               ''' 

            }
        }
        stage('Deploy to hub') {
            steps {
                sh '''
                docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW
                docker tag $IMAGE:$(cat version.txt) $REGISTRY/$IMAGE:$(cat version.txt)
                docker push $REGISTRY/$IMAGE:$(cat version.txt)
                '''
            }
        }
    }
}