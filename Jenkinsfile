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
                    git branch: 'main', credentialsId: 'git_cred', url: 'https://github.com/Elyes44/pipeline_chatSpring.git';
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
/*
          stage('SonarQube analysis Spring Boot') {
                   steps {
                         dir('achat') {
               withSonarQubeEnv(installationName:'sonarqube-8.9.7') {
             sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
               }
                         }
    } 
  }
      */  
        stage("Publish to Nexus Repository Manager") {
    steps {
        script {
            sh 'mvn clean deploy '
        }
    }
}



/***********************************************************************************************************************/
 /*        stage("Publish to Nexus Repository Manager") {
            steps {
                script {
                    pom = readMavenPom file: "pom.xml";
                    filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
                    echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
                    artifactPath = filesByGlob[0].path;
                    artifactExists = fileExists artifactPath;
                    if(artifactExists) {
                        echo "*** File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version}";
                        nexusArtifactUploader(
                            nexusVersion: "nexus3",
                            protocol: "http",
                            nexusUrl: "192.168.49.2:30001",
                            groupId: pom.groupId,
                            version: pom.version,
                            repository: "maven-releases",
                            credentialsId: "NEXUS_ID",
                            artifacts: [
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file:artifactPath,
                                type: pom.packaging],
                                [artifactId: pom.artifactId,
                                classifier: '',
                                file: "pom.xml",
                                type: "pom"]
                            ]
                        );
                    } else {
                        error "*** File: ${artifactPath}, could not be found";
                    }
                }
            }
        }*/
/**********************************************************************************************************/
       
    }
}
