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
      }
    }

    stage('Push to AWS ECR') {
      steps {
        script {
          docker.build('public.ecr.aws/o0b2b3z9/shovon_capstone:latest', ' .')
          docker.withRegistry('', '') {
            docker.image('public.ecr.aws/o0b2b3z9/shovon_capstone:latest').push()}
          }

        }
      }

    }
    environment {
      registry = 'sobbosachi/capstone_project'
      registryCredential = 'dockerHub'
    }
  }