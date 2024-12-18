
pipeline {
    agent any
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub-credentials')
        DOCKER_IMAGE = "your-dockerhub-username/react-jenkins-docker-k8s"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/BasavarajSamrat/react-todo-list-app-main.git' 
            }
        }
        stage('Build') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'DOCKER_HUB_CREDENTIALS') {
                        docker.image(DOCKER_IMAGE).push("latest")
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh "kubectl apply -f k8s-deployment.yaml"
                    sh "kubectl apply -f k8s-service.yaml"
                }
            }
        }
    }
}
