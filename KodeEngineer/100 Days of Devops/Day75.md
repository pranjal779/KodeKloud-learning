# Day 75: Jenkins Slave Nodes

[reference 1](https://dev.to/wycliffealphus/100-days-of-devops-day-75-221)
[reference 2](https://medium.com/@janemils/kodekloud-engineer-day-75-jenkins-slave-nodes-9d6023b953f6)

The Nautilus DevOps team has installed and configured new Jenkins server in Stratos DC which they will use for CI/CD and for some automation tasks. There is a requirement to add all app servers as slave nodes in Jenkins so that they can perform tasks on these servers using Jenkins. Find below more details and accomplish the task accordingly.

Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.

1. Add all app servers as SSH build agent/slave nodes in Jenkins. Slave node name for app server 1, app server 2 and app server 3 must be App_server_1, App_server_2, App_server_3 respectively.


2. Add labels as below:


App_server_1 : stapp01

App_server_2 : stapp02

App_server_3 : stapp03


3. Remote root directory for App_server_1 must be /home/tony/jenkins, for App_server_2 must be /home/steve/jenkins and for App_server_3 must be /home/banner/jenkins.


4. Make sure slave nodes are online and working properly.


Note:

1. You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case, please make sure to refresh the UI page.


2. For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.


<img width="822" height="1291" alt="image" src="https://github.com/user-attachments/assets/b065462d-c1e6-48ad-aa75-f24ffbfbc08f" />
<img width="977" height="712" alt="image" src="https://github.com/user-attachments/assets/398c5e93-a97c-449b-bed7-3e589543b0e3" />
<img width="1766" height="676" alt="image" src="https://github.com/user-attachments/assets/806d05ef-d9b2-4734-9a3a-b6898dd2c9d7" />
<img width="2395" height="1212" alt="image" src="https://github.com/user-attachments/assets/f44c1f68-2b6f-4a83-b675-da4364ea11cd" />
<img width="2390" height="1387" alt="image" src="https://github.com/user-attachments/assets/90e09562-c414-405b-bf00-e268023c2c4b" />
<img width="2405" height="1222" alt="image" src="https://github.com/user-attachments/assets/c84d8a90-aa6e-408f-ad1f-3da980a58298" />
<img width="2446" height="1417" alt="image" src="https://github.com/user-attachments/assets/2592bafa-f76f-4ccb-ae9c-cdcb77dcf73c" />
<img width="1745" height="912" alt="image" src="https://github.com/user-attachments/assets/88ff1ddc-3ab1-41be-b08c-be0cf6527654" />
<img width="2021" height="1161" alt="image" src="https://github.com/user-attachments/assets/6adc5c22-6290-4e39-8ffc-5310e23cd8d7" />
<img width="787" height="1106" alt="image" src="https://github.com/user-attachments/assets/5d315c95-0639-4645-9eae-2c787b35d3fc" />
<img width="716" height="1080" alt="image" src="https://github.com/user-attachments/assets/21bd4af8-27f9-4a72-b731-d5f5082c1b11" />
<img width="930" height="651" alt="image" src="https://github.com/user-attachments/assets/e7a0da65-7da5-40c7-ae0e-9b9f577cbd47" />
<img width="710" height="642" alt="image" src="https://github.com/user-attachments/assets/1f4b128f-7784-4c3c-a68b-1acb469df800" />
<img width="2305" height="1177" alt="image" src="https://github.com/user-attachments/assets/6530ad44-82a0-48c5-b771-500be00504a8" />
<img width="2306" height="1212" alt="image" src="https://github.com/user-attachments/assets/85266795-b713-4677-85e2-91db9a9f4e35" />
<img width="1122" height="1222" alt="image" src="https://github.com/user-attachments/assets/fe8ff35d-00e8-4d0b-a667-4ffde44f029c" />
<img width="2495" height="1185" alt="image" src="https://github.com/user-attachments/assets/dda45c50-12b3-48d8-a368-cafefa4ccfea" />
<img width="2495" height="1185" alt="image" src="https://github.com/user-attachments/assets/f2b557a7-56fa-46c2-ac8c-450db1026814" />
