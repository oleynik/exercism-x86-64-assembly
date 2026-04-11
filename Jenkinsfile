pipeline {
    agent {
        docker {
            image 'gcc:13-bookworm'
            args  '-u root:root'
        }
    }
    options {
        timestamps()
        timeout(time: 30, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '20'))
    }
    stages {
        stage('Build') {
            steps {
                sh '''
                    apt-get update
                    apt-get install -y --no-install-recommends nasm
                    for d in */; do
                        (cd "$d" && make tests LDFLAGS='-Wl,-z,noexecstack') || exit 1
                    done
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                    for d in */; do
                        (cd "$d" && ./tests) || exit 1
                    done
                '''
            }
        }
    }
}
