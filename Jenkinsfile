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
               	bat 'newman run C:/Users/wasim El-jomaa/.jenkins/workspace/wasimJenkinsLab/postman/postmancollection.json --environment postmanenvironment.json --reporters junit'
            }
            post {
                always {
                    junit '**/*xml'
                }
            }
        }
     	
 	}
}
