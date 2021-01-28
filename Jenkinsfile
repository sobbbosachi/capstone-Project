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
echo "####Virtual environment created####"'''
      }
    }

    stage('Install dependencies') {
      steps {
        sh '''. ./.capstone-env/bin/activate
make install
echo "####Dependencies installed####"'''
      }
    }

    stage('Linting') {
      steps {
        sh '''. ./.capstone-env/bin/activate
make lint
echo "####Linting operation done####"'''
      }
    }

    stage('Build Docker image') {
      steps {
        sh 'dockerImage = docker.build("sobbosachi/capstone_project", "-f Dockerfile .")'
      }
    }

  }
}