# Day 78: Jenkins Conditional Pipeline

<img width="842" height="867" alt="image" src="https://github.com/user-attachments/assets/b48cf6eb-0844-4f47-86cd-2547260a4eaa" />
<img width="886" height="1091" alt="image" src="https://github.com/user-attachments/assets/05583375-fa7b-4276-9861-8589f683eaa5" />


The development team of xFusionCorp Industries is working on to develop a new static website and they are planning to deploy the same on Nautilus App Server using Jenkins pipeline. They have shared their requirements with the DevOps team and accordingly we need to create a Jenkins pipeline job. Please find below more details about the task:

Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.

Similarly, click on the Gitea button on the top bar to access the Gitea UI. Login using username sarah and password Sarah_pass123. There under user sarah you will find a repository named web_app that is already cloned on App Server 1 under /var/www/html. sarah is a developer who is working on this repository.

Add a slave node named App Server 1. It should be labeled as stapp01 and its remote root directory should be /home/sarah/jenkins_agent (the repository is cloned under /var/www/html).

We have already cloned repository on App Server 1 under /var/www/html.

Apache is already installed on the app server and is running on port 8080.

Create a Jenkins pipeline job named nautilus-webapp-job (it must not be a Multibranch pipeline) and configure it to:


Add a string parameter named BRANCH.

It should conditionally deploy the code from web_app repository under /var/www/html on App Server 1, as this is the document root of the app server. The pipeline should have a single stage named Deploy ( which is case sensitive ) to accomplish the deployment.

The pipeline should be conditional, if the value master is passed to the BRANCH parameter then it must deploy the master branch, on the other hand if the value feature is passed to the BRANCH parameter then it must deploy the feature branch.

LB server is already configured. You should be able to see the latest changes you made by clicking on the App button. Please make sure the required content is loading on the main URL https://<LBR-URL> i.e there should not be a sub-directory like https://<LBR-URL>/web_app etc.


Note:

You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case, please make sure to refresh the UI page.

For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.


---

## Adding the plugins

[reference](https://medium.com/@janemils/kodekloud-engineer-day-78-jenkins-deploy-pipeline-4569103f7769)

<img width="2076" height="405" alt="image" src="https://github.com/user-attachments/assets/147b3315-2253-4783-9d19-20682d855bc4" />



## Adding and Setuping up the Agent

<img width="1900" height="807" alt="image" src="https://github.com/user-attachments/assets/8b3d5d45-adf6-446b-b98b-84efd4d725b0" />
<img width="1812" height="680" alt="image" src="https://github.com/user-attachments/assets/73fdee4b-95b2-4478-bc6d-2c89dc0ad082" />
<img width="1777" height="697" alt="image" src="https://github.com/user-attachments/assets/d33a4e3f-4f3a-4555-abfa-67a55da01876" />

<img width="1416" height="1200" alt="image" src="https://github.com/user-attachments/assets/e35a2b88-9a69-41b1-91e2-09e4aec7f09d" />
<img width="1335" height="212" alt="image" src="https://github.com/user-attachments/assets/038bf286-ae01-4aee-93b7-4179766ef529" />
<img width="862" height="927" alt="image" src="https://github.com/user-attachments/assets/b06f7386-d107-45f2-a183-ddbebcc44eab" />
<img width="1540" height="630" alt="image" src="https://github.com/user-attachments/assets/7802f68d-f2f6-442e-8dcd-b683e1975f7e" />
<img width="1371" height="1057" alt="image" src="https://github.com/user-attachments/assets/9e1a4dad-2633-4665-badd-c7dc00c5fe5a" />
<img width="2251" height="1097" alt="image" src="https://github.com/user-attachments/assets/bd696d99-7e63-4887-9c46-81addc6d162b" />
<img width="1732" height="992" alt="image" src="https://github.com/user-attachments/assets/78dd2551-fbdb-43fb-b239-a3a7da165cfd" />
<img width="806" height="987" alt="image" src="https://github.com/user-attachments/assets/48f11ad0-e2d6-4551-9b3e-5ba0b6cca520" />
<img width="2357" height="796" alt="image" src="https://github.com/user-attachments/assets/847e2628-f913-4fa3-9632-12536ed141c2" />
<img width="2297" height="1020" alt="image" src="https://github.com/user-attachments/assets/457d7a58-5269-44e3-9a7d-658267e9354f" />
<img width="2246" height="551" alt="image" src="https://github.com/user-attachments/assets/29494eaa-2365-45bc-ab21-fad1d6d0c46a" />
<img width="2487" height="1161" alt="image" src="https://github.com/user-attachments/assets/feee7b4c-930d-4e04-9ce0-eee8c9f044cb" />
<img width="1162" height="676" alt="image" src="https://github.com/user-attachments/assets/12656253-85f0-468f-8684-16bb7acacb33" />
<img width="2255" height="677" alt="image" src="https://github.com/user-attachments/assets/3452e1b6-84c3-477d-8b96-88c5ebe36678" />


## Step 3 check the git in server

<img width="2317" height="1157" alt="image" src="https://github.com/user-attachments/assets/2363346c-0025-4299-a417-7b9a1b208ed9" />
<img width="2317" height="1157" alt="image" src="https://github.com/user-attachments/assets/023731ea-36e5-4979-ad46-14caeeca484d" />


## Step 4 create the pipeline job

<img width="936" height="927" alt="image" src="https://github.com/user-attachments/assets/7b4c11a8-fb7a-4853-bb30-452627a3835c" />
<img width="2080" height="882" alt="image" src="https://github.com/user-attachments/assets/df546fba-7603-488e-b5ab-c66e962d02f0" />
<img width="1315" height="1085" alt="image" src="https://github.com/user-attachments/assets/f24c1682-5cff-4015-9f6d-e1303e028e3a" />
<img width="1662" height="782" alt="image" src="https://github.com/user-attachments/assets/1239d0a5-7c8f-4ed8-b861-422faae8206d" />


# Step 5: Setup Passwordless connection between Jenkins server and the Stapp01 (app server 1)

<img width="1377" height="946" alt="image" src="https://github.com/user-attachments/assets/8e99d3a9-ccf9-4594-82e8-8fd79e1d6a47" />
<img width="1020" height="1062" alt="image" src="https://github.com/user-attachments/assets/0b97dffc-943c-45e8-99ba-72686deae4e2" />
<img width="2360" height="1205" alt="image" src="https://github.com/user-attachments/assets/46b17400-5c93-4346-bea0-721aa6fb7733" />


# Step 6: Validate if job run is successful.

<img width="937" height="862" alt="image" src="https://github.com/user-attachments/assets/68943431-71f4-4c29-a052-ba6c386b386e" />
<img width="1116" height="735" alt="image" src="https://github.com/user-attachments/assets/5a8b9dd4-7697-40e8-9eed-c5d0e28e1233" />
<img width="1022" height="737" alt="image" src="https://github.com/user-attachments/assets/0bc88781-480a-4df1-83d3-7453211ec864" />
<img width="1660" height="957" alt="image" src="https://github.com/user-attachments/assets/35c72eaf-67aa-4d00-88f2-9ccf404445be" />
<img width="1587" height="732" alt="image" src="https://github.com/user-attachments/assets/ab2d30b7-54d4-4faa-9cb6-b178042d0726" />
<img width="1101" height="860" alt="image" src="https://github.com/user-attachments/assets/0171238d-ad49-4ddd-a207-de99fd310a64" />
<img width="1160" height="825" alt="image" src="https://github.com/user-attachments/assets/374e74fb-e636-46a0-9e30-b02a5892ccb9" />
<img width="1501" height="980" alt="image" src="https://github.com/user-attachments/assets/b232cf6c-954f-4791-a030-de8c26eee03c" />
<img width="2527" height="747" alt="image" src="https://github.com/user-attachments/assets/c0ac7522-1e5d-4eb9-8550-2f491e754b3d" />
<img width="1317" height="756" alt="image" src="https://github.com/user-attachments/assets/2873f00a-90b7-4d0d-85b4-d508cfefbea6" />
<img width="2545" height="742" alt="image" src="https://github.com/user-attachments/assets/27c211ce-f9f8-426c-90d9-cac40992e89e" />
<img width="2181" height="740" alt="image" src="https://github.com/user-attachments/assets/3a751205-16a8-438f-9433-56745c741291" />
<img width="2527" height="742" alt="image" src="https://github.com/user-attachments/assets/8a3e47dc-09a5-4caf-a4af-a64095d25033" />
<img width="2242" height="811" alt="image" src="https://github.com/user-attachments/assets/779b7f42-baf9-454e-9329-54e19acbcebc" />
<img width="2362" height="1180" alt="image" src="https://github.com/user-attachments/assets/59e8ac5b-eeca-422b-8057-7049ea001749" />
<img width="2350" height="1197" alt="image" src="https://github.com/user-attachments/assets/e5ea144f-c821-4a57-8d9d-767e646c0a00" />






````sh
thor@jumphost ~$ shh tony@stapp01
bash: shh: command not found
thor@jumphost ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (10.244.97.218)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
[tony@stapp01 ~]$ sudo su sarah
[sarah@stapp01 tony]$ java --version
openjdk 11.0.20.1 2023-08-24 LTS
OpenJDK Runtime Environment (Red_Hat-11.0.20.1.1-2) (build 11.0.20.1+1-LTS)
OpenJDK 64-Bit Server VM (Red_Hat-11.0.20.1.1-2) (build 11.0.20.1+1-LTS, mixed mode, sharing)
[sarah@stapp01 tony]$ sudo yum install java-17-openjdk -y

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

For security reasons, the password you type will not be visible.

[sudo] password for sarah: 
Last metadata expiration check: 0:25:54 ago on Tue Jun 30 12:04:45 2026.
Dependencies resolved.
============================================================================================================================
 Package                               Architecture        Version                             Repository              Size
============================================================================================================================
Installing:
 java-17-openjdk                       x86_64              1:17.0.18.0.8-2.el9                 appstream              428 k
Installing dependencies:
 java-17-openjdk-headless              x86_64              1:17.0.18.0.8-2.el9                 appstream               44 M

Transaction Summary
============================================================================================================================
Install  2 Packages

Total download size: 45 M
Installed size: 187 M
Downloading Packages:
(1/2): java-17-openjdk-17.0.18.0.8-2.el9.x86_64.rpm                                         2.2 MB/s | 428 kB     00:00    
(2/2): java-17-openjdk-headless-17.0.18.0.8-2.el9.x86_64.rpm                                 50 MB/s |  44 MB     00:00    
----------------------------------------------------------------------------------------------------------------------------
Total                                                                                        40 MB/s |  45 MB     00:01     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Running scriptlet: java-17-openjdk-headless-1:17.0.18.0.8-2.el9.x86_64                                                1/1 
  Preparing        :                                                                                                    1/1 
  Installing       : java-17-openjdk-headless-1:17.0.18.0.8-2.el9.x86_64                                                1/2 
  Running scriptlet: java-17-openjdk-headless-1:17.0.18.0.8-2.el9.x86_64                                                1/2 
  Installing       : java-17-openjdk-1:17.0.18.0.8-2.el9.x86_64                                                         2/2 
  Running scriptlet: java-17-openjdk-1:17.0.18.0.8-2.el9.x86_64                                                         2/2 
  Running scriptlet: java-17-openjdk-headless-1:17.0.18.0.8-2.el9.x86_64                                                2/2 
  Running scriptlet: java-17-openjdk-1:17.0.18.0.8-2.el9.x86_64                                                         2/2 
  Verifying        : java-17-openjdk-1:17.0.18.0.8-2.el9.x86_64                                                         1/2 
  Verifying        : java-17-openjdk-headless-1:17.0.18.0.8-2.el9.x86_64                                                2/2 

Installed:
  java-17-openjdk-1:17.0.18.0.8-2.el9.x86_64               java-17-openjdk-headless-1:17.0.18.0.8-2.el9.x86_64              

Complete!
[sarah@stapp01 tony]$ java --version
openjdk 17.0.18 2026-01-20 LTS
OpenJDK Runtime Environment (Red_Hat-17.0.18.0.8-2) (build 17.0.18+8-LTS)
OpenJDK 64-Bit Server VM (Red_Hat-17.0.18.0.8-2) (build 17.0.18+8-LTS, mixed mode, sharing)
[sarah@stapp01 tony]$ cd /var/www/html/
[sarah@stapp01 html]$ git branch
* feature
  master
[sarah@stapp01 html]$ ls
feature.html  index.html
[sarah@stapp01 html]$ exit
exit
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jumphost ~$ ssh jenins@jenkins
The authenticity of host 'jenkins (10.244.81.93)' can't be established.
ED25519 key fingerprint is SHA256:tyX2fFBjS0A5pNlRaih+266sGG9JD0LpsFdIAX9iMzA.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'jenkins' (ED25519) to the list of known hosts.
jenins@jenkins's password: 
Permission denied, please try again.
jenins@jenkins's password: 

thor@jumphost ~$ ^C
thor@jumphost ~$ ssh jenkins@jenkins
jenkins@jenkins's password: 
Permission denied, please try again.
jenkins@jenkins's password: 
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.8.0-94-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

jenkins@jenkins:~$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/var/lib/jenkins/.ssh/id_rsa): 
Created directory '/var/lib/jenkins/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /var/lib/jenkins/.ssh/id_rsa
Your public key has been saved in /var/lib/jenkins/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:pibtnLSC8SPtwaYx4LAnx54EhFwAs1vt0ckR8veSsPY jenkins@jenkins.stratos.xfusioncorp.com
The key's randomart image is:
+---[RSA 4096]----+
|+.... o.         |
|oo.. = o         |
|oo. o * .        |
|.o . . + o       |
|=   . o S .      |
|o=.. o + .       |
|o.B== = E        |
| *o*=B o         |
|  +o.o=          |
+----[SHA256]-----+
jenkins@jenkins:~$ ssh-copy-id sarah@stapp01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/var/lib/jenkins/.ssh/id_rsa.pub"
The authenticity of host 'stapp01 (10.244.97.218)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? 
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
The authenticity of host 'stapp01 (10.244.97.218)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? 

/usr/bin/ssh-copy-id: ERROR: Host key verification failed.

jenkins@jenkins:~$ ssh-copy-id sarah@stapp01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/var/lib/jenkins/.ssh/id_rsa.pub"
The authenticity of host 'stapp01 (10.244.97.218)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? 
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
The authenticity of host 'stapp01 (10.244.97.218)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
sarah@stapp01's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'sarah@stapp01'"
and check to make sure that only the key(s) you wanted were added.

jenkins@jenkins:~$ ssh 'sarah@stapp01'
Last login: Tue Jun 30 12:28:46 2026
[sarah@stapp01 ~]$



```














