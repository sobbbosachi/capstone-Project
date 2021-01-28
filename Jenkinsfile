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
        sh '''dockerpath=sobbosachi/capstone_project
echo "Docker ID and Image: $dockerpath"
docker login -u DOCKER_USER -p DOCKER_PASSWORD
docker tag shovon_capstone_project $dockerpath
docker push $dockerpath'''
        echo 'Pushed image to docker repository'
      }
    }

  }
  environment {
    DOCKER_USER = 'sobbosachi'
    DOCKER_PASSWORD = 'A8l8Ah3kBt'
  }
}