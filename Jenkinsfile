pipeline {
  agent any

  environment {
    APP_NAME = "my-app"
  }

  stages {

    stage('Clone Code') {
      steps {
        echo "Cloning repository..."
        git url: 'https://github.com/goutham3007/spring-petclinic01.git', branch: 'main'
      }
    }

    stage('Build') {
      steps {
        echo "Building the application..."
        sh './build.sh' // or mvn clean install, npm install, etc.
      }
    }

    stage('Test') {
      steps {
        echo "Running tests..."
        sh './run-tests.sh' // or mvn test, pytest, etc.
      }
    }

    stage('Package') {
      steps {
        echo "Packaging application..."
        sh 'tar -czf $APP_NAME.tar.gz ./build'
      }
    }

    stage('Deploy') {
      when {
        branch 'main'
      }
      steps {
        echo "Deploying to production..."
        sh './deploy.sh'
      }
    }
  }

  post {
    success {
      echo "Pipeline completed successfully."
    }
    failure {
      echo "Pipeline failed."
    }
  }
}

