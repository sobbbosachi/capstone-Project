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
pwd'''
        echo 'Virtual environment created'
      }
    }

    stage('Install dependencies') {
      steps {
        sh '''. ./.capstone-env/bin/activate
make install'''
        echo 'Dependencies installed from requirement.txt '
      }
    }

    stage('Linting') {
      steps {
        sh '''. ./.capstone-env/bin/activate
make lint'''
        echo 'Linting operation done'
      }
    }

    stage('Build Docker image') {
      steps {
        echo 'Building the Docker container...'
        sh '''docker build --tag=shovon_capstone_project .
docker image ls
'''
        echo 'Docker container build'
      }
    }

    stage('Push docker image') {
      steps {
        sh './upload_docker.sh'
        echo 'Pushed image to docker repository'
      }
    }

  }
  environment {
    DOCKER_ID = 'dockerhub_credential'
  }
}