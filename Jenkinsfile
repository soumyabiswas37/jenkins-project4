pipeline {
    agent any
    stages {
        stage("Build") {
            agent {
                label "Build"
            }
            steps {
                sh 'sudo yum install docker -y'
                sh 'sudo systemctl enable --now docker'
                sh 'sudo git clone https://github.com/soumyabiswas37/jenkins-project4.git'
                sh 'sudo docker build -t newcontainer:v$BUILD_NUMBER .'
                sh 'sudo docker images'
                sh '''
                sudo docker run -d --name MYCONTAINER_$BUILD_NUMBER -p 8$BUILD_NUMBER:80 newcontainer:v$BUILD_NUMBER 
                sudo docker ps -a
                '''
                sh 'sudo curl http://localhost:8$BUILD_NUMBER'
            }
            post {
                success {
                    echo "Build job is successful"
                }
                failure {
                    echo "Build job is failed"
                }
            }
        }
        stage("Approval"){
            steps {
                input message: "Do you want to proceed?", ok: 'Yes'
            }
        }
        stage("Test") {
            agent {
                label "Test"
            }
            steps {
                sh 'sudo yum install docker -y'
                sh 'sudo systemctl enable --now docker'
                sh 'sudo git clone https://github.com/soumyabiswas37/jenkins-project4.git'
                sh 'sudo docker build -t newcontainer:v$BUILD_NUMBER .'
                sh 'sudo docker images'
                sh '''
                sudo docker run -d --name MYCONTAINER_$BUILD_NUMBER -p 8$BUILD_NUMBER:80 newcontainer:v$BUILD_NUMBER 
                sudo docker ps -a
                '''
                sh 'sudo curl http://localhost:8$BUILD_NUMBER'
            }
            post {
                success {
                    echo "Test job is successful"
                }
                failure {
                    echo "Test job is failed"
                }
            }
        }
        stage("Parallel Cleanup") {
            parallel {
                stage("Cleanup Workspace Agent1") {
                    agent {label "Build"}
                    steps {
                        cleanWs()
                    }
                }
                stage("Clean Workspace Agent2") {
                    agent {label "Test"}
                    steps {
                        cleanWs()
                    }
                }
            }
        }

    }
}