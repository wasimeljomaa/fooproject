pipeline {
  	agent any 
  	stages {
	    stage('Build') {
	    	steps {
	        	bat "mvn compile"
	      	}
	    }  
	    stage('Test') {
	      	steps {
	        	bat "mvn test"
	      	}
	     	post {
	      		always {
	        		junit '**/TEST*.xml'
	      		}
	     	}
	    }
    	stage('newman') {
            steps {
               	bat 'newman run postman/postmancollection.json --environment postman/postmanenvironment.json --reporters junit'
            }
            post {
                always {
                    junit '**/*xml'
                }
            }
        }
        stage('Robot Framework System tests with Selenium') {
            steps {
                bat 'InfotivLab/Test robot --variable BROWSER:headlesschrome -d  InfotivLab/Test Results'
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
