pipeline{
    agent any
    stages{
        stage("git checkout"){
            steps{
                echo "========executing git checkout========"
                git branch: 'master', url: 'https://github.com/latesh-11/docker-jenkins-project.git'
               
            }
        }
        stage("image build"){
            steps{
                echo "========executing image build========"
                sh 'docker image build -t ${JOB_NAME}:v1.${BUILD_ID} .'
                sh 'docker image tag ${JOB_NAME}:v1.${BUILD_ID} lateshh/${JOB_NAME}:v1.${BUILD_ID} '
                sh 'docker image tag ${JOB_NAME}:v1.${BUILD_ID} lateshh/${JOB_NAME}:latest '
                }
        }
        stage("image push to dockerhub"){
            steps{
                echo "========executing image push========"
                withCredentials([string(credentialsId: 'docker-pass', variable: 'DockerPasswd')]) {
                    sh "docker login -u lateshh -p ${DockerPasswd}"
                    sh 'docker image push lateshh/${JOB_NAME}:v1.${BUILD_ID}'
                    sh 'docker image push lateshh/${JOB_NAME}:latest'
                    sh 'chmod 777 /var/run/docker.sock'

                    // Removing all the images we created

                    sh 'docker image rm -f ${JOB_NAME}:v1.${BUILD_ID} lateshh/${JOB_NAME}:v1.${BUILD_ID} lateshh/${JOB_NAME}:latest '

                }
                
            }
        }
        stage('docker container deployment'){
            steps{
                echo "========executing docker container deployment ========"
                script {
                    def docker_run = 'docker  run -it -d --name ScriptedContainer -p 9000:80 lateshh/docker-webapp'
                    def PrivateIp = "172.31.83.252" // its a private key
                    def docker-rmv-container = 'docker container rm -f ScriptedContainer'
                    def docker-rmi = 'docekr image rm -f lateshh/docker-webapp'
                    sshagent(['webapp-server']) {
                        sh 'chmod 777 /var/run/docker.sock'
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@${PrivateIp} ${docker_run}"
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@${PrivateIp} ${docekr-rmv-container}"
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@${PrivateIp} ${docker_rmi}"  
                    }
                    
                }
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}   
