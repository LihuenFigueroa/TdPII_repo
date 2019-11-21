pipeline {
    agent any 
    stages {
        stage('Clone repo') { 
            steps {
                sh 'git clone https://github.com/LihuenFigueroa/TdPII_repo.git'
            }
        }
        stage('Build and Compile') { 
            steps {
                 sh 'cd my_blink'
                 sh  'touch my_blink.cpp'
                 sh 'echo #include <Arduino.h>'
                 sh 'cat my_blink.ino'
                 sh 'cd ..'
                 sh 'make'
            }
        }
        stage('Export by FTP'){
            steps{
                sh 'cd '
            }
        }
    }
}