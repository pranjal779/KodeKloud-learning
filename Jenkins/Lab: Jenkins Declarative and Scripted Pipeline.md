# Lab: Jenkins Declarative and Scripted Pipeline

This lab explores the two primary syntaxes for defining Jenkins pipelines: Declarative and Scripted, enabling users to understand their fundamental differences, advantages, and appropriate use cases for building Continuous Integration/Continuous Delivery (CI/CD) workflows. [1, 2]  
Lab Description This lab is designed to provide hands-on experience in creating and comparing Jenkins Declarative and Scripted Pipelines. Participants will learn to implement "Pipeline-as-code" using  for both syntaxes, which are committed to a source control repository. [3, 4]  
Learning Objectives Upon completion of this lab, you will be able to: 

• Differentiate between the syntax and structure of Declarative and Scripted Pipelines. 
• Create and configure basic CI/CD pipelines using both the  (Declarative) and  (Scripted) blocks. 
• Implement key pipeline concepts such as , , , and  within both syntax types. 
• Understand the flexibility and limitations of each style (e.g., built-in error handling in Declarative vs. full Groovy power in Scripted). 
• Determine which pipeline syntax is best suited for different scenarios, from simple, standardized workflows to complex, custom automation tasks. [1, 2, 5, 6, 7, 8, 9]  

Lab Modules The lab is typically broken down into the following modules: 

• Module 1: Introduction to Jenkins Pipelines: Overview of "Pipeline-as-code" and the purpose of a . 
• Module 2: Scripted Pipeline Implementation: Hands-on coding of a basic build and test pipeline using the Groovy-based Scripted syntax and  blocks. 
• Module 3: Declarative Pipeline Implementation: Hands-on coding of the same (or similar) pipeline using the simpler, more structured Declarative syntax with  and  blocks. 
• Module 4: Comparison and Advanced Features: Discussion and exercises on specific features like parallel execution, conditional steps ( directive in Declarative), and integrating custom logic via shared libraries or  blocks. [2, 3, 6, 7]  

<img width="1822" height="982" alt="image" src="https://github.com/user-attachments/assets/593096fc-12e5-4dbc-8ab9-70331d9f2adc" />
<img width="1830" height="995" alt="image" src="https://github.com/user-attachments/assets/55ca3ffd-3605-47f3-9d47-e3aacbd01ab2" />
<img width="1013" height="675" alt="image" src="https://github.com/user-attachments/assets/84b5211f-6f6c-41f1-a24e-952bed23620f" />
<img width="1017" height="803" alt="image" src="https://github.com/user-attachments/assets/4e6cbd0b-ef52-47cb-836b-0a9cda80a9fc" />
<img width="1782" height="1352" alt="image" src="https://github.com/user-attachments/assets/0b3fbe83-4f19-4cff-9bb3-81f3a295a7ae" />
<img width="1033" height="330" alt="image" src="https://github.com/user-attachments/assets/f3784d45-2001-48dd-b74f-8ddd11979809" />
<img width="967" height="1291" alt="image" src="https://github.com/user-attachments/assets/a129048b-a0aa-4662-a8f4-ebdd822c5a27" />
<img width="1008" height="1333" alt="image" src="https://github.com/user-attachments/assets/43e8df21-2d8b-49f4-9170-b565cec413ad" />

```Jenkinsfile
pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    sh 'npm install'
                }
            }
        }

        stage('Run App') {
            steps {
                script {
                    // Stop any previous instance of the app
                    sh 'pkill -f "node app.js" || true'

                    // Start the app in the background and redirect logs
                    sh 'nohup node app.js > app.log 2>&1 &'

                    // Wait a few seconds to ensure the app starts
                    sleep 60

                    // Check if the app is running
                    sh 'curl http://localhost:3001 || echo "App is not responding!"'
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
        }
    }
}
```

<img width="2505" height="1342" alt="image" src="https://github.com/user-attachments/assets/6a933e4b-2cbf-4eee-a4b9-7bb92e21f192" />
<img width="2467" height="1285" alt="image" src="https://github.com/user-attachments/assets/85f2d077-258e-46a8-b754-8bd15d36140f" />
<img width="1450" height="752" alt="image" src="https://github.com/user-attachments/assets/14d8c3f9-0da9-4cbb-8c75-e4ab08bd9463" />
<img width="900" height="737" alt="image" src="https://github.com/user-attachments/assets/aa9a92bc-47dc-43b0-bf1b-0f09bfbccc34" />
<img width="1912" height="793" alt="image" src="https://github.com/user-attachments/assets/da3de020-8c19-43e0-85f8-d02af55b4588" />
<img width="1308" height="752" alt="image" src="https://github.com/user-attachments/assets/78dccd3f-82de-422a-b67e-eae9fd79f55b" />
<img width="1477" height="855" alt="image" src="https://github.com/user-attachments/assets/1aa658d4-e430-4e63-b530-4cdbf0100cee" />
<img width="948" height="1307" alt="image" src="https://github.com/user-attachments/assets/b28b37dc-5cf8-482b-927a-efae2b4f2725" />
<img width="986" height="1206" alt="image" src="https://github.com/user-attachments/assets/f775b3e4-9df3-40e3-9772-7a2bf7ad5ddb" />
<img width="1000" height="358" alt="image" src="https://github.com/user-attachments/assets/07919797-a6e7-4784-8af7-c0b96dc00c78" />
<img width="960" height="1331" alt="image" src="https://github.com/user-attachments/assets/b8624443-bd16-4318-ac6a-c35cdded5531" />
<img width="960" height="800" alt="image" src="https://github.com/user-attachments/assets/5bb122a9-2c65-4040-ab63-01a6ddc59c73" />
<img width="2516" height="1305" alt="image" src="https://github.com/user-attachments/assets/d522abcc-5669-4183-8bd0-d4958537ce8a" />
<img width="1882" height="772" alt="image" src="https://github.com/user-attachments/assets/56423990-7b28-4bfa-9cbf-416d29a75e8c" />
<img width="1906" height="758" alt="image" src="https://github.com/user-attachments/assets/20c5276e-f58a-4664-a6e8-10bc8f9a183c" />
<img width="1032" height="1257" alt="image" src="https://github.com/user-attachments/assets/3a7e162a-f96d-41b9-a430-9f79c3bfa61f" />


