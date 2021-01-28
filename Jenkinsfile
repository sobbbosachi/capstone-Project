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

    stage('run app') {
      steps {
        sh '''. ./.capstone-env/bin/activate
python3 app.py
^C
echo "####Dependencies installed####"'''
      }
    }

  }
}