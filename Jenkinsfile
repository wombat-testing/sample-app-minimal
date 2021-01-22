pipeline {
  agent {
    kubernetes {
      label 'sample-app-minimal'
      idleMinutes 5
      yamlFile 'build-pod.yaml'
      defaultContainer 'build'
    }
  }

  stages {
    stage('CI Build') {
      when { changeRequest() }
        steps {
          sh "make docker-push"
        }
    }

    stage('Master Build') {
      when { branch 'master' }
      steps {
        sh "make"
      }
    }
  }
}


