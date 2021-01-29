pipeline {
  agent any
  stages {
    stage('Create virtualenv') {
      steps {
        sh '''ls -ltra
make setup'''
        echo 'Virtual environment created'
      }
    }

    stage('Source it & Install dependencies') {
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
        script {
          docker.build('sobbosachi/capstone_project:latest', ' .')
          docker.withRegistry('', 'dockerHub') {
            docker.image('sobbosachi/capstone_project:latest').push()}
          }

        }
      }

      stage('Push to AWS ECR') {
        steps {
          script {
            docker.build('669482944502.dkr.ecr.eu-central-1.amazonaws.com/shovon:latest', ' .')
            docker.withRegistry('https://669482944502.dkr.ecr.eu-central-1.amazonaws.com', 'ecr:eu-central-1:aaaa28d1-0a6b-4617-874e-85b09b22f962') {
              docker.image('669482944502.dkr.ecr.eu-central-1.amazonaws.com/shovon:latest').push()}
            }

          }
        }

      }
    }