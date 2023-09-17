pipeline {
    agent any
    tools {
        maven "MAVEN"
    }
    stages {
        stage("Clone code from GitHub") {
            steps {
                script {
                    git branch: 'main', credentialsId: 'git_cred', url: 'https://github.com/Elyes44/deploy.git';
                }
            }
        }
        stage("Maven Build") {
            steps {
                script {
                    sh 'mvn clean install'
                    sh 'mvn test'
                }
            }
        }
        stage("Publish to Nexus Repository Manager") {
            steps {
                dir('chat_deploy') {
                    sh 'mvn deploy'
                }
            }
        }
    }
}
