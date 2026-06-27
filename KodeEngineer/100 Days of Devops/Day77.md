# Day 77: Jenkins Deploy Pipeline

[reference 1](https://medium.com/@janemils/kodekloud-engineer-day-77-jenkins-deploy-pipeline-86efadd6abea)   
[reference 2](https://dev.to/wycliffealphus/100-days-of-devops-day-77-48d8)    

Manage Jenkins → Plugins → Available Plugins  

Installed:  

- Git plugin
- SSH Agent plugin
- Pipeline plugin

The development team of xFusionCorp Industries is working on to develop a new static website and they are planning to deploy the same on Nautilus App Server using Jenkins pipeline.  
They have shared their requirements with the DevOps team and accordingly we need to create a Jenkins pipeline job. Please find below more details about the task:  



Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.
Similarly, click on the Gitea button on the top bar to access the Gitea UI. Login using username sarah and password Sarah_pass123.  
There under user sarah you will find a repository named web_app that is already cloned on App Server 1 under /var/www/html. sarah is a developer who is working on this repository.  

1. Add a slave node named App Server 1. It should be labeled as stapp01 and its remote root directory should be /home/sarah/jenkins_agent (the repository is cloned under /var/www/html; the agent uses a separate directory so it does not pollute the repo).  

2. We have already cloned repository on App Server 1 under /var/www/html.

3. Apache is already installed on the app server and is running on port 8080.

4. Create a Jenkins pipeline job named devops-webapp-job (it must not be a Multibranch pipeline) and configure it to:

  * Deploy the code from web_app repository under /var/www/html on App Server 1, as this is the document root of the app server. The pipeline should have a single stage named Deploy ( which is case sensitive ) to accomplish the deployment.

LB server is already configured. You should be able to see the latest changes you made by clicking on the App button. Please make sure the required content is loading on the main URL https://<LBR-URL> i.e there should not be a sub-directory like https://<LBR-URL>/web_app etc.



Note:  

You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case, please make sure to refresh the UI page.   

For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.   



<img width="842" height="1017" alt="image" src="https://github.com/user-attachments/assets/b5f568fd-37fc-49ea-a26a-1734af434179" />
<img width="1722" height="552" alt="image" src="https://github.com/user-attachments/assets/ae482ef2-0a59-4698-8ca3-a01c4fbb57e7" />
<img width="1785" height="565" alt="image" src="https://github.com/user-attachments/assets/efa0c474-8e93-4248-ae57-484d86f8e1ce" />
<img width="1771" height="477" alt="image" src="https://github.com/user-attachments/assets/c0bcb150-c4ed-48dc-9f1e-33a46dbbf256" />
<img width="1597" height="617" alt="image" src="https://github.com/user-attachments/assets/b5b315ba-aa36-4529-ba49-22c54d84d4e3" />
<img width="560" height="282" alt="image" src="https://github.com/user-attachments/assets/30147774-484a-45b1-8b61-d1bfd2da4ade" />
<img width="1057" height="1062" alt="image" src="https://github.com/user-attachments/assets/5a8966cd-e07a-4f15-b98e-ef2732fe6b24" />
<img width="1897" height="575" alt="image" src="https://github.com/user-attachments/assets/e7d6aec0-428e-45a0-b609-c5eb00ec7f32" />
<img width="1651" height="877" alt="image" src="https://github.com/user-attachments/assets/9a16b014-25e6-4c8e-bc19-eb83dc825a6a" />
<img width="900" height="1157" alt="image" src="https://github.com/user-attachments/assets/5169a838-7ec4-4b87-b9c3-d598ea91c369" />
<img width="942" height="655" alt="image" src="https://github.com/user-attachments/assets/1fba1dfb-6c4a-4068-9be1-84bea8c4a109" />
<img width="795" height="715" alt="image" src="https://github.com/user-attachments/assets/5cb88953-34ff-44c2-8a5e-987e5cdee323" />
<img width="2451" height="1132" alt="image" src="https://github.com/user-attachments/assets/1783c8a5-777d-436b-a3e0-0dbb541e0c63" />
<img width="2360" height="1162" alt="image" src="https://github.com/user-attachments/assets/de7547fa-7d1a-49ee-a771-61b7a2c3a634" />
<img width="2130" height="1122" alt="image" src="https://github.com/user-attachments/assets/e81fe501-ea2d-49f1-8137-a19440924e15" />
<img width="2172" height="905" alt="image" src="https://github.com/user-attachments/assets/fd4acbe1-d419-47a2-b0ae-5d5756a72cc4" />
<img width="857" height="847" alt="image" src="https://github.com/user-attachments/assets/a001329f-b8cb-40ef-98e4-c9093a34bfaf" />
<img width="742" height="785" alt="image" src="https://github.com/user-attachments/assets/65c9ddc3-64a7-466a-a93f-f621a92f91f0" />
<img width="2240" height="447" alt="image" src="https://github.com/user-attachments/assets/e75afa56-e3f5-4dca-a224-523fa413081e" />
<img width="2462" height="1205" alt="image" src="https://github.com/user-attachments/assets/e9ca31da-0878-4215-9f98-ba5e89fc825a" />
<img width="2526" height="667" alt="image" src="https://github.com/user-attachments/assets/11ee5a5a-c967-4297-b57b-7f23ddee04e8" />
<img width="2437" height="1167" alt="image" src="https://github.com/user-attachments/assets/66e164fc-79fe-4ede-99b2-c7bc1fcdd6ca" />
<img width="2427" height="540" alt="image" src="https://github.com/user-attachments/assets/93087d45-ab62-4ede-8edd-e99602a6d49e" />
<img width="786" height="190" alt="image" src="https://github.com/user-attachments/assets/2235b612-1f8d-4ec3-8741-513cc254e5c9" />
<img width="1355" height="1087" alt="image" src="https://github.com/user-attachments/assets/4d420aaf-3c30-40a5-a209-00bd7d9a4843" />
<img width="1027" height="671" alt="image" src="https://github.com/user-attachments/assets/3e00319a-6b5e-400d-a86e-5512ec28a09f" />
<img width="1202" height="542" alt="image" src="https://github.com/user-attachments/assets/3c9fcdf6-7878-4c29-ae29-32d110f2c5fa" />
<img width="2457" height="1137" alt="image" src="https://github.com/user-attachments/assets/3f428f9c-882f-49d5-bcee-d0ac203a0f9c" />
<img width="1026" height="777" alt="image" src="https://github.com/user-attachments/assets/cca4c4cb-2867-46bd-a13b-484a0110d254" />
<img width="867" height="912" alt="image" src="https://github.com/user-attachments/assets/29ac7a8e-0d18-4299-96aa-56aec43b604b" />
<img width="1517" height="1112" alt="image" src="https://github.com/user-attachments/assets/bcac9dbb-3c5e-43f9-aca4-f1345a3dab42" />
<img width="2390" height="1182" alt="image" src="https://github.com/user-attachments/assets/8da78376-8c0b-4521-8668-7929509ef9d4" />

<img width="2500" height="775" alt="image" src="https://github.com/user-attachments/assets/f246c2a6-8796-4df8-8623-7575462cd0d9" />


```
Based on the task description in the image, here are the core steps to complete the assignment: 
1. Add Jenkins Slave Node 1. Log in to Jenkins using the provided credentials (admin / AdmIn321). 
2. Navigate to Manage Jenkins &gt; Nodes &gt; New Node. 
3. Name:  App Server 1
4. Remote root directory:  /home/sarah/jenkins_agent
5. Labels:  stapp01
6. Launch the agent (likely via SSH using Sarah's credentials or a pre-configured key). 

2. Create Jenkins Pipeline Create a new Pipeline job (not Multibranch) named devops-webapp-job. 
Pipeline Script Requirements: 

• Agent: Use the label stapp01. 
• Stage Name: Deploy (case sensitive). 
• Action: Deploy the code from the Gitea repository (found at /var/www/html on App Server 1) to the web root. 

Example Jenkinsfile snippet:
pipeline {
    agent { label 'stapp01' }
    stages {
        stage('Deploy') {
            steps {
                // Ensure the deployment directory is correct
                sh 'cp -r /var/www/html/web_app/* /var/www/html/'
            }
        }
    }
}



3. Verification • Apache is already running on port 8080. 
• After running the pipeline, click the App button or visit the Load Balancer URL. 
• The content should load directly at the root URL (e.g., http://<LB-URL>/), not under a sub-directory like /web_app

AI responses may include mistakes.


```

# Restarting the task:

<img width="676" height="1332" alt="image" src="https://github.com/user-attachments/assets/00f06b29-e657-42fe-9974-4508e7186ccd" />

<img width="2522" height="812" alt="image" src="https://github.com/user-attachments/assets/88414ccf-d9d5-40ca-947c-ab48f9f57f53" />
<img width="1746" height="670" alt="image" src="https://github.com/user-attachments/assets/66853659-01df-4846-b3f5-058ccff4640c" />
<img width="1762" height="572" alt="image" src="https://github.com/user-attachments/assets/4aec6acf-1bb4-4231-afd1-e28f413d17f7" />
<img width="2496" height="997" alt="image" src="https://github.com/user-attachments/assets/2ddd4441-0dce-4a0e-bc05-781d515f1f4d" />
<img width="1580" height="1190" alt="image" src="https://github.com/user-attachments/assets/b4105873-46e1-4799-974a-8ceeaac6b0ce" />
<img width="1790" height="907" alt="image" src="https://github.com/user-attachments/assets/a28cb6ac-45eb-4e67-864c-17db81f4f03b" />
<img width="1497" height="1147" alt="image" src="https://github.com/user-attachments/assets/f6677c66-f1f6-44aa-a3f9-278569ec7b3b" />
<img width="1507" height="1157" alt="image" src="https://github.com/user-attachments/assets/5623cf4e-3cc9-47e8-89f8-0ff78956e3b9" />
<img width="1222" height="1046" alt="image" src="https://github.com/user-attachments/assets/2808b6de-3af8-4cbe-9fbd-5b68f1182c25" />
<img width="1512" height="1131" alt="image" src="https://github.com/user-attachments/assets/6c91669c-f4bd-477b-b157-3d179bc5f06a" />
<img width="1831" height="1105" alt="image" src="https://github.com/user-attachments/assets/3eb924ac-d8e3-482e-8ed4-be45c04a6a07" />
<img width="1675" height="1162" alt="image" src="https://github.com/user-attachments/assets/045e0c83-a656-44b9-95b0-1648146c8d67" />
<img width="1762" height="1147" alt="image" src="https://github.com/user-attachments/assets/e42cd967-ce9a-416a-884e-e9870b36fc7c" />
<img width="1672" height="1176" alt="image" src="https://github.com/user-attachments/assets/ae14a8b8-372e-4a84-9501-73ae6b9d72d0" />
<img width="1716" height="1131" alt="image" src="https://github.com/user-attachments/assets/63d6a9a2-c47e-48f0-b43d-6d95717a6f16" />
<img width="1836" height="1127" alt="image" src="https://github.com/user-attachments/assets/04f5d24c-6850-4db3-b3ae-fd0aa5e0a567" />
<img width="1682" height="1142" alt="image" src="https://github.com/user-attachments/assets/36de9fb3-cd9d-4151-9fd6-6eccd96cd879" />
<img width="1600" height="1152" alt="image" src="https://github.com/user-attachments/assets/acc225a5-75de-40aa-b773-3b93697bcc0d" />
<img width="171" height="92" alt="image" src="https://github.com/user-attachments/assets/859f3a8d-2074-4265-8d2c-a431872fd033" />











