pipeline {
  agent {
    label 'gce-node'
  }

  stages {
    stage('CI Build') {
      when { changeRequest() }
        steps {
          withCredentials([file(credentialsId: 'wombat-dev-283614-gcr-sa.json', variable: 'GSA_JSON_FILE')]) {
            sh '''
              gcloud auth activate-service-account --key-file $GSA_JSON_FILE
              gcloud auth configure-docker --quiet eu.gcr.io
              make docker-push
            '''
          }
        }
    }

    stage('Master Build') {
      when { branch 'master' }
      steps {
        sh 'make'
      }
    }
  }
}


