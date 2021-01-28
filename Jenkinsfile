pipeline {
<<<<<<< HEAD
  agent any
=======
  agent none
>>>>>>> 2c2280c202ad4704f20a1733ee7d2397fcceb9a9
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
        script {
          'dockerImage = docker.build("sobbosachi/capstone_project", "-f Dockerfile .")'
        }

        echo 'Docker container build and pusher'
      }
    }

    stage('Push docker image') {
      steps {
        sh 'docker login'
      }
    }

  }
}