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

    stage('Docker image build & pushed') {
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

        stage('Create kubeconfig file') {
          steps {
            withAWS(region: 'eu-central-1', credentials: 'aaaa28d1-0a6b-4617-874e-85b09b22f962') {
              sh '''aws eks --region eu-central-1 update-kubeconfig --name udaCapCluster
'''
            }

          }
        }

        stage('Deployment') {
          steps {
            withAWS(credentials: 'aaaa28d1-0a6b-4617-874e-85b09b22f962', region: 'eu-central-1') {
              sh '''sh \'aws eks --region eu-central-1 update-kubeconfig --name udaCapCluster\'
sh \'kubectl config use-context arn:aws:eks:eu-central-1:669482944502:cluster/udaCapCluster\'
sh \'kubectl apply -f deployment.yml\'
sh \'kubectl get pods\'
sh \'kubectl get services\''''
            }

          }
        }

      }
    }