pipeline {
    agent any

    environment {
        // Change to your DockerHub username/repo if needed
        IMAGE_NAME = "dhanushnadar/my-flask-app"
        IMAGE_TAG = "build-${BUILD_NUMBER}"
    }

    stages {
        stage('📥 Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/DhanushNadar/demo-python-app.git'
            }
        }

        stage('🐳 Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
                }
            }
        }

        stage('🚀 Run Docker Container') {
            steps {
                script {
                    // Optional: Stop/remove if container already running
                    sh 'docker rm -f flask-container || true'

                    // Run the container in background
                    sh 'docker run -d -p 5000:5000 --name flask-container $IMAGE_NAME:$IMAGE_TAG'
                }
            }
        }
    }

    post {
        success {
            echo "✅ App successfully deployed!"
        }
        failure {
            echo "❌ Build failed!"
        }
    }
}
