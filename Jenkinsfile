pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        ECR_REGISTRY = '393060838514.dkr.ecr.ap-south-1.amazonaws.com'
        ECR_REPOSITORY = 'finserv-microservices'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build \
                      -t account-service:${BUILD_NUMBER} \
                      services/account-service
                '''
            }
        }

        stage('Test Application') {
            steps {
                sh '''
                    set -eu

                    docker rm -f account-service-test || true

                    docker run -d \
                      --name account-service-test \
                      -p 127.0.0.1:18000:8000 \
                      account-service:${BUILD_NUMBER}

                    for i in $(seq 1 20); do
                      if curl -fsS http://127.0.0.1:18000/health; then
                        echo "Health check passed"
                        exit 0
                      fi
                      sleep 2
                    done

                    docker logs account-service-test
                    exit 1
                '''
            }
        }

        stage('Push to Amazon ECR') {
            steps {
                sh '''
                    set -eu

                    IMAGE="$ECR_REGISTRY/$ECR_REPOSITORY:account-service-$BUILD_NUMBER"

                    aws ecr get-login-password \
                      --region "$AWS_REGION" |
                    docker login \
                      --username AWS \
                      --password-stdin "$ECR_REGISTRY"

                    docker tag account-service:${BUILD_NUMBER} "$IMAGE"
                    docker push "$IMAGE"
                '''
            }
        }
    }

    post {
        always {
            sh 'docker rm -f account-service-test || true'
        }
    }
}