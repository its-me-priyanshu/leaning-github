pipeline {
    agent any
    
    stages{
        
        stage("Code") {
            steps {
                git url: "https://github.com/its-me-priyanshu/leaning-github.git" , branch: "main"
                echo "This is Cloning the code"
                echo "I have added a new Dockerfile"
            }
        }

        stage("Build") {
            steps {
                sh "docker build -t nginx-app:latest ."
                echo "This is Build the code"
            }
        }

        stage("Test") {
            steps {
                echo "This is testing the code"
            }
        }
        
        stage("Push") {
            steps {
                echo "Push Docker image to Docker-Hub"

            withCredentials([usernamePassword(
            credentialsId: "dockerhubtoken",
            usernameVariable: "USER",
            passwordVariable: "PASS")])
            {
            sh '''
            echo $PASS | docker login -u $USER --password-stdin
            '''
            sh "docker image tag nginx-app:latest $USER/nginx-app:latest"
            sh "docker push $USER/nginx-app:latest"
              }
            }
         }

        stage("Deploy") {
             steps {
                sh "docker compose down && docker-compose up -d"
                echo "This is Deploy the code"
              }
           }
   }
}
