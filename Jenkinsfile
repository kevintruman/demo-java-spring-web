pipeline {
	agent {
		docker {
			image 'maven:3.8.4-openjdk-11-slim'
			args '-v /root/.m2:/root/.m2'
			args '-p 9010:8080'
		}
	}
	options {
		skipStagesAfterUnstable()
	}
	stages {
		stage('Build') {
			steps {
				sh 'mvn -B -DskipTests clean package'
			}
		}
		stage('Test') {
			steps {
				sh 'mvn test'
			}
			post {
				always {
					junit 'target/surefire-reports/*.xml'
				}
			}
		}
		stage('Deliver') {
			steps {
				sh 'chmod 777 ./run.sh'
				sh 'chmod 777 ./kill.sh'
				sh './run.sh'
				// input message: 'Finished using the web site? (Click "Proceed" to continue)'
				// sh './kill.sh'
			}
		}
	}
}