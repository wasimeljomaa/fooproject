pipeline {
  	agent any 
  	stages {
	    stage('Build') {
	    	steps {
	        	sh "mvn compile"
	      	}
	    }  
	    stage('Test') {
	      	steps {
	        	sh "mvn test"
	      	}
	     	post {
	      		always {
	        		junit '**/TEST*.xml'
	      		}
	     	}
	    }
    	stage('newman') {
            steps {
               	sh 'newman run postman/postman_collection.json --environment postman/postman_environment.json --reporters junit'
            }
            post {
                always {
                    junit '**/*xml'
                }
            }
        }
        stage('Robot Framework System tests with Selenium') {
            steps {
                sh 'InfotivLab/Test/Lab2 robot --variable BROWSER:headlesschrome InfotivLab/Test Results'
            }
            post {
                always {
                    script {
                          step(
                                [
                                  $class              : 'RobotPublisher',
                                  outputPath          : 'Results',
                                  outputFileName      : '**/output.xml',
                                  reportFileName      : '**/report.html',
                                  logFileName         : '**/log.html',
                                  disableArchiveOutput: false,
                                  passThreshold       : 50,
                                  unstableThreshold   : 40,
                                  otherFiles          : "**/*.png,**/*.jpg",
                                ]
                          )
                    }
                }
            }
        }		
     	
 	}
}
