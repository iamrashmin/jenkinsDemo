pipeline{
    agent any
    tools{
        maven 'maven'
    }
    stages{
        stage("Build Maven"){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/iamrashmin/jenkinsDemo']])
                sh 'mvn clean install'
            }
        }
        stage("Build Docker Image"){
            steps{
                script{
                    sh 'docker build -t rp40867/docker-jenkins-demo .'
                }
            }
        }
        stage("Publish Docker Image"){
            steps{
                script {
                    withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerpwd')]) {
                        sh 'docker login -u rp40867 -p ${dockerpwd}'

                        sh 'docker push rp40867/docker-jenkins-demo'
}
                }


            }
        }
    }
}