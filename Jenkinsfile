pipeline {
    agent any
    tools {
        maven "MAVEN"
    }
    stages {
        
        stage("Cleanup Workspace") {
    steps {
        cleanWs()
    }
}

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
                }
            }
        }
        stage("Publish to Nexus Repository Manager") {
    steps {
        script {
            // Add the -X option to the Maven command
            sh 'mvn clean deploy -X'
        }
    }
}
       
    }
}
