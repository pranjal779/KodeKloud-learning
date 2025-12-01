# Lab: Jenkins Pipeline with ENV using SCM
<img width="1728" height="1070" alt="image" src="https://github.com/user-attachments/assets/b4cdb629-1dfe-4ec9-a900-6e82c0f5f137" />
<img width="1183" height="872" alt="image" src="https://github.com/user-attachments/assets/42a230ad-968a-41de-a381-68b3563a79e5" />
<img width="1177" height="1256" alt="image" src="https://github.com/user-attachments/assets/86b596f8-d67f-4d89-b8c6-b8458fd52f8f" />
<img width="2261" height="1262" alt="image" src="https://github.com/user-attachments/assets/8a92004b-4442-4237-a1c6-40537e440be2" />
<img width="1162" height="402" alt="image" src="https://github.com/user-attachments/assets/2ae0a32e-93e6-442c-98d1-ce3e63b7b0f7" />
<img width="1078" height="1306" alt="image" src="https://github.com/user-attachments/assets/4980ccf1-02f5-45a5-a9f9-a905a592ae0a" />
<img width="1092" height="1338" alt="image" src="https://github.com/user-attachments/assets/0d59191b-4f98-4ec9-8e33-5766b6ef4f00" />
<img width="1053" height="1307" alt="image" src="https://github.com/user-attachments/assets/7ea3e16f-9ad6-48ec-83f9-f8795563cf78" />
<img width="666" height="415" alt="image" src="https://github.com/user-attachments/assets/b898516e-f00c-47fa-9bc5-53c10774fbf2" />

```jenkinsfile
pipeline {
    agent any

    environment {
        REPO_URL = "http://git-server:3000/max/python-app.git"
        REPO_DIR = "${WORKSPACE}/python-app"  // Use Jenkins workspace directory
        BRANCH_NAME = "main"
        RUN_TESTS = "true"
        PYTHON_VERSION = "python3"
    }

    stages {
        stage('Checkout Code') {
            steps {
                script {
                    echo "Cloning branch: ${BRANCH_NAME} from ${REPO_URL}"
                    sh """
                        if [ -d "${REPO_DIR}" ]; then
                            cd ${REPO_DIR}
                            git reset --hard
                            git checkout ${BRANCH_NAME}
                            git pull origin ${BRANCH_NAME}
                        else
                            git clone --branch ${BRANCH_NAME} ${REPO_URL} ${REPO_DIR}
                        fi
                    """
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    echo "Installing dependencies..."
                    dir("${REPO_DIR}") {
                        sh """
                            set -e
                            ${PYTHON_VERSION} -m venv venv
                            . venv/bin/activate
                            pip install --upgrade pip
                            pip install -r requirements.txt
                        """
                    }
                }
            }
        }

        stage('Run Tests') {
            when {
                expression { return env.RUN_TESTS == "true" }
            }
            steps {
                script {
                    echo "Running tests..."
                    dir("${REPO_DIR}") {
                        sh """
                            set -e
                            . venv/bin/activate
                            pytest --junitxml=reports/test-results.xml
                        """
                    }
                }
            }
        }

        stage('Run Application') {
            steps {
                script {
                    echo "Starting Flask app for 60 seconds..."
                    dir("${REPO_DIR}") {
                        sh '''
                            set -e
                            . venv/bin/activate
                            echo "Flask app will run for 60 seconds..."
                            timeout 60s python app.py || echo "App terminated after timeout, ignoring error"
                        '''
                    }
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline executed successfully!"
        }
        failure {
            echo "Pipeline failed!"
        }
    }
}
```

<img width="1182" height="937" alt="image" src="https://github.com/user-attachments/assets/32194d82-35e4-414d-820e-12d161aedc75" />
<img width="1890" height="796" alt="image" src="https://github.com/user-attachments/assets/6c77c1d4-f550-4e38-ac01-d60c683b8bc2" />
<img width="1110" height="1272" alt="image" src="https://github.com/user-attachments/assets/13144b37-d64d-40d4-af89-b5e49a2eb825" />
