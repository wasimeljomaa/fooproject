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
               	bat 'newman run postman/postman_collection.json --environment postman_environment.json --reporters junit'
            }
            post {
                always {
                    junit '**/*xml'
                }
            }
        }
     	
 	}
}
