# day 81: jenkins multistage pipeline

<img width="1530" height="491" alt="image" src="https://github.com/user-attachments/assets/0c218869-339b-4195-ac32-4ab618e90cbc" />
<img width="1776" height="661" alt="image" src="https://github.com/user-attachments/assets/9bd0baa0-b381-42d3-b984-2a0c50d30b6a" />
<img width="1637" height="1147" alt="image" src="https://github.com/user-attachments/assets/a3ab5416-022a-4e9b-a789-680552e6ce67" />
<img width="842" height="977" alt="image" src="https://github.com/user-attachments/assets/30e683bf-54ff-49eb-8ef2-5fa1c4ff228e" />
<img width="2340" height="1187" alt="image" src="https://github.com/user-attachments/assets/2e69a7f5-9d9c-434f-ac1f-0001af8c319f" />
<img width="1685" height="671" alt="image" src="https://github.com/user-attachments/assets/05c2935d-b890-46e1-87df-e6a30dc27124" />
<img width="1687" height="1207" alt="image" src="https://github.com/user-attachments/assets/528575b0-a9fb-4e16-863f-a0e40ec99877" />
<img width="2532" height="1217" alt="image" src="https://github.com/user-attachments/assets/cc50557d-eeee-4bca-9a31-c75d738a005a" />
<img width="1877" height="1222" alt="image" src="https://github.com/user-attachments/assets/a96e132a-95fc-4ba0-ae14-a442750e7f7a" />
<img width="2465" height="670" alt="image" src="https://github.com/user-attachments/assets/76d69860-ed33-4d09-b1a4-d13b798b1b46" />
<img width="2412" height="1200" alt="image" src="https://github.com/user-attachments/assets/7f532095-edc4-4eae-872d-60b9b4bd580a" />


### Step-3: Create the Multistage Jenkins Pipeline Job.

<img width="807" height="1082" alt="image" src="https://github.com/user-attachments/assets/fdb595e8-b638-4127-8759-837904c8d5af" />
<img width="1190" height="972" alt="image" src="https://github.com/user-attachments/assets/659aa5c8-b662-4d73-ada3-e69de7e3bc76" />
<img width="1616" height="1067" alt="image" src="https://github.com/user-attachments/assets/184e2722-f4a2-40d5-a2e8-d2d9e2246fad" />
<img width="1757" height="387" alt="image" src="https://github.com/user-attachments/assets/eb414626-975f-421e-8f60-32b5883cd4ec" />
<img width="1837" height="812" alt="image" src="https://github.com/user-attachments/assets/f648fe98-640a-4b25-9c6c-b7ab4145e520" />
<img width="1852" height="1127" alt="image" src="https://github.com/user-attachments/assets/5551d80c-4bef-4d4b-b65c-64c6608cca14" />
<img width="2317" height="1237" alt="image" src="https://github.com/user-attachments/assets/4393261a-28c4-4c07-b830-5c244d290ec0" />


```sh
pipeline {
    agent {
        label 'stapp01'
    }
    
    environment {
        APP_URL     = 'https://8091-port-6uu5tuciz3twzvso.labs.kodekloud.com/'
        REPO_URL    = 'https://3000-port-6uu5tuciz3twzvso.labs.kodekloud.com/sarah/web.git'
        DEPLOY_DIR  = '/var/www/html'
    }
    
    stages {
        
        stage ('Deploy') {
            steps {
                // Ensure the deploy directory exists.
                sh """
                    cd ${DEPLOY_DIR}
                    git pull origin master
                """
            }
        }
        
        stage ('Test') {
            steps {
                // Simple health check via curl.
                sh """
                echo 'Testing ${APP_URL}...'
                sleep 5
                curl --fail --silent --show-error ${APP_URL} || (echo 'APPLICATION IS DOWN' && exit 1)
                """
            }
        }
    }
}
```


<img width="812" height="737" alt="image" src="https://github.com/user-attachments/assets/8aeee271-4b8d-4a3c-b00f-8ac5e7154446" />
<img width="937" height="742" alt="image" src="https://github.com/user-attachments/assets/247e5c32-d64b-4e8f-b787-073c9a79b43e" />
<img width="717" height="695" alt="image" src="https://github.com/user-attachments/assets/82eaea82-cd60-4591-bb7e-e8556cb54027" />
<img width="2542" height="791" alt="image" src="https://github.com/user-attachments/assets/77f6aeaa-e160-4a25-aaf2-e6e4488d4abb" />
<img width="2520" height="1132" alt="image" src="https://github.com/user-attachments/assets/70b8f796-58bf-4804-898b-3a4f39005191" />
<img width="2551" height="986" alt="image" src="https://github.com/user-attachments/assets/d20dba45-fce0-422d-826a-ceb2c772fbca" />
<img width="2180" height="1217" alt="image" src="https://github.com/user-attachments/assets/8a362cb2-f98e-42c5-b554-4a2190439e5d" />

<img width="2522" height="781" alt="image" src="https://github.com/user-attachments/assets/200d85e2-f62c-4656-b923-13fe99e0e58f" />

<img width="1977" height="721" alt="image" src="https://github.com/user-attachments/assets/54f2da26-8b53-4887-ac22-18d1a631c3df" />
<img width="740" height="202" alt="image" src="https://github.com/user-attachments/assets/1e5b3e71-9102-453e-b6e4-5afce8c318a8" />
<img width="1822" height="971" alt="image" src="https://github.com/user-attachments/assets/03579d58-c8ce-4548-acf4-a6822c2c9503" />
<img width="1457" height="637" alt="image" src="https://github.com/user-attachments/assets/fc8ad77c-cc19-41ef-b661-b7e2f2373f72" />
<img width="862" height="782" alt="image" src="https://github.com/user-attachments/assets/66f64523-8127-4360-bd52-4a7111265724" />
<img width="1065" height="855" alt="image" src="https://github.com/user-attachments/assets/71a32a23-ccd8-4718-a328-ac6fc058a10d" />
<img width="382" height="182" alt="image" src="https://github.com/user-attachments/assets/ee889e8f-c90b-469a-bb5e-086d80fe1475" />
<img width="2521" height="1117" alt="image" src="https://github.com/user-attachments/assets/c99b57f4-be96-48d9-8a76-ba54d45aeefe" />
<img width="2532" height="951" alt="image" src="https://github.com/user-attachments/assets/dc8b7551-659d-4c74-a59b-e13cb3bd05b2" />
<img width="2405" height="1167" alt="image" src="https://github.com/user-attachments/assets/3d0e4467-8391-48e2-ad22-2b1082839abb" />








