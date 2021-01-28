pipeline {
  agent any
  stages {
    stage('Check python3') {
      steps {
        sh '''python3 --version
which python3'''
      }
    }

    stage('Create virtualenv & source it') {
      steps {
        sh '''make setup
pwd
. ./.capstone-env/bin/activate
echo "####Virtual environment created####"'''
      }
    }

    stage('Install dependencies') {
      steps {
        sh 'make install'
      }
    }

    stage('Linting') {
      steps {
        sh 'make lint'
      }
    }

    stage('run app') {
      steps {
        sh '''python3 app.py

if curl -s http://localhost:3200/ | grep "home!"
then
  echo "done"
else
  echo "something wrong"
fi'''
      }
    }

  }
}