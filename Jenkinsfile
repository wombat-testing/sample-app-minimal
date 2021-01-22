pipeline {
  agent {
    kubernetes {
      label 'sample-app-minimal'
      podRetention never()
      yamlFile 'build-pod.yaml'
      defaultContainer 'build'
    }
  }

  stages {
    stage('CI Build') {
      when { changeRequest() }
        steps {
          sh "apk update"
          sh "apk add --no-cache iptables curl make musl-dev git go"
          sh "dockerd&"
          withCredentials([file(credentialsId: 'registry-eu.gcr.io', variable: 'registry_config')]) {
           sh "make docker-push DOCKER_CONFIG=\$(dirname \$registry_config)"
          }
        }
    }

    stage('Master Build') {
      when { branch 'master' }
      steps {
        sh "apk update"
        sh "apk add --no-cache iptables curl make musl-dev git go"        
        sh "dockerd&"
        sh "make"
      }
    }
  }
}


