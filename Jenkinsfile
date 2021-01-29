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
      docker.withRegistry('https://index.docker.io/v1/', 'docker-hub') {
      app.push("${env.BUILD_NUMBER}")
      app.push("latest")
    }

  }
}