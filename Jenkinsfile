pipeline {
  agent any
  stages {
    stage('Create virtualenv & source it') {
      steps {
        sh '''ls -ltra
make setup'''
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
        sh '''#docker build --tag=shovon_capstone_project .
#docker image ls

'''
        echo 'Docker container build'
        script {
          docker.build('sobbosachi/capstone_project:latest', ' .')
          docker.withRegistry('', 'dockerHub') {
            docker.image('sobbosachi/capstone_project:latest').push()}
          }

        }
      }

    }
    environment {
      registry = 'sobbosachi/capstone_project'
      registryCredential = 'dockerHub'
    }
  }