# Day 76: Jenkins Project Security

[reference 1](https://dev.to/wycliffealphus/100-days-of-devops-day-76-1fi7)
[reference 2](https://medium.com/@janemils/kodekloud-engineer-day-76-jenkins-project-security-5273abaa24c4)

The xFusionCorp Industries has recruited some new developers. There are already some existing jobs on Jenkins and two of these new developers need permissions to access those jobs. The development team has already shared those requirements with the DevOps team, so as per details mentioned below grant required permissions to the developers.  
  
Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.  
There is an existing Jenkins job named Packages, there are also two existing Jenkins users named sam with password sam@pass12345 and rohan with password rohan@pass12345.  

Grant permissions to these users to access Packages job as per details mentioned below:  

a.) Make sure to select Inherit permissions from parent ACL under inheritance strategy for granting permissions to these users.  
b.) Grant mentioned permissions to sam user : build, configure and read.  
c.) Grant mentioned permissions to rohan user : build, cancel, configure, read, update and tag.  


Note:  
Please do not modify/alter any other existing job configuration.  
You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case, please make sure to refresh the UI page.   
For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.   


<img width="2436" height="1210" alt="image" src="https://github.com/user-attachments/assets/46fb8b0f-9b28-4854-984e-04b3612168d2" />
<img width="2111" height="116" alt="image" src="https://github.com/user-attachments/assets/ce6a35d7-700a-4284-9f92-e99b4c7a0b61" />
<img width="2526" height="471" alt="image" src="https://github.com/user-attachments/assets/072e33ce-4391-43c9-a329-1d47320f740d" />
<img width="1230" height="242" alt="image" src="https://github.com/user-attachments/assets/8a3af849-b736-4f54-a6b9-32beac776a56" />
<img width="1405" height="1062" alt="image" src="https://github.com/user-attachments/assets/75d98f42-ce21-4bde-842c-ca84c275d70a" />
<img width="2012" height="1132" alt="image" src="https://github.com/user-attachments/assets/9671e87a-0e2b-4c20-a43e-62c260d8fd66" />
<img width="2540" height="510" alt="image" src="https://github.com/user-attachments/assets/50f7f2c0-c162-46a5-8012-96bbb43065e4" />
<img width="2387" height="1226" alt="image" src="https://github.com/user-attachments/assets/4c0c1b5f-9339-4ff1-aa52-bd293cafab18" />
<img width="2542" height="640" alt="image" src="https://github.com/user-attachments/assets/b6a81660-b25c-4721-a874-f158d6c4d537" />
<img width="1275" height="537" alt="image" src="https://github.com/user-attachments/assets/baca926f-e5e4-4fa4-b945-47b58fc32955" />
<img width="2540" height="547" alt="image" src="https://github.com/user-attachments/assets/10979f30-139b-440d-b52d-66ba8bf4848b" />
<img width="937" height="687" alt="image" src="https://github.com/user-attachments/assets/901b4264-0472-4fd5-9398-7665dd8b2139" />
<img width="1407" height="485" alt="image" src="https://github.com/user-attachments/assets/cbe8c510-be90-4f38-b7d3-267137a45c72" />
<img width="890" height="1352" alt="image" src="https://github.com/user-attachments/assets/c54fcc6e-742d-4e82-89f1-9cd6b416b9f7" />
<img width="980" height="1405" alt="image" src="https://github.com/user-attachments/assets/7e494102-1593-4151-adb4-5c43cc3c0904" />
<img width="1002" height="770" alt="image" src="https://github.com/user-attachments/assets/a3a2b17b-91ab-497f-a726-ab5a02acbd00" />






