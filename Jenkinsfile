pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning repository..."
                git url: 'https://github.com/BasavarajSamrat/react-todo-list-app-main.git', branch: 'main'
            }
        }
        stage('Install Dependencies') {
            steps {
                echo "Installing dependencies..."
                sh 'npm install'
            }
        }
        stage('Start Application') {
            steps {
                echo "Starting the application..."
                sh 'nohup npm start &'
            }
        }
    }
    post {
        success {
            echo 'Application deployed successfully!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
