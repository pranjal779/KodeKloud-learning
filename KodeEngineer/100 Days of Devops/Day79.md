# Day 79: Jenkins Deployment Job

<img width="942" height="1187" alt="image" src="https://github.com/user-attachments/assets/bac6f053-284d-456e-9f30-e8a0ac992853" />
<img width="841" height="862" alt="image" src="https://github.com/user-attachments/assets/f0ca22b7-9abe-43e6-b39e-5b2ae39f1baa" />


The Nautilus development team had a meeting with the DevOps team where they discussed automating the deployment of one of their apps using Jenkins (the one in Stratos Datacenter). They want to auto deploy the new changes in case any developer pushes to the repository. As per the requirements mentioned below configure the required Jenkins job.

Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and Adm!n321 password.

Similarly, you can access the Gitea UI using Gitea button. Username and password for Git are sarah and Sarah_pass123. Under user sarah you will find a repository named web that is already cloned on App Server 1 under sarah's home (/home/sarah/web). sarah is a developer who is working on this repository.

1. httpd is already installed and configured on the app server (listening on port 8080). Ensure the httpd service is running on App Server 1 (e.g. start it manually if needed). You can make starting/restarting httpd part of your Jenkins job if you prefer.

2. Create a Jenkins job named datacenter-app-deployment and configure it so that if anyone pushes any new change to the origin repository in master branch, the job should auto build and deploy the latest code on App Server 1 under /var/www/html directory.
Before deployment, ensure that the ownership of the /var/www/html directory is set to user sarah, so that Jenkins can successfully deploy files to that directory.


3. SSH into App Server 1 using sarah user credentials mentioned above. Under sarah user's home (/home/sarah/web) you will find a cloned Git repository named web. Under this repository there is an index.html file, update its content to Welcome to the xFusionCorp Industries, then push the changes to the origin into master branch. This push must trigger your Jenkins job and the latest changes must be deployed on the server, also make sure it deploys the entire repository content not only index.html file.


Click on the App button on the top bar to access the app. Please make sure the required content is loading on the main URL (e.g. http://stlb01:8091) i.e there should not be any sub-directory like http://stlb01:8091/web etc.

Note:
1. You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also some times Jenkins UI gets stuck when Jenkins service restarts in the back end so in such case please make sure to refresh the UI page.

2. Make sure Jenkins job passes even on repetitive runs as validation may try to build the job multiple times.

3. Deployment related tasks should be done by sudo user on the destination server to avoid any permission issues so make sure to configure your Jenkins job accordingly.

4. For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.

---



<img width="1247" height="827" alt="image" src="https://github.com/user-attachments/assets/a0d9118c-6100-4a02-aee7-0565706f3ac9" />


## Step 1: Setup the Pre-requisites.

<img width="2515" height="442" alt="image" src="https://github.com/user-attachments/assets/7e4de5f4-645f-4592-9e64-fd4ca57cb50c" />
<img width="1412" height="1120" alt="image" src="https://github.com/user-attachments/assets/949e2c6c-9742-4e69-b97c-a017479430cf" />
<img width="827" height="727" alt="image" src="https://github.com/user-attachments/assets/087ecc0f-b3eb-4b7a-93be-63453836869f" />



## Step-2: Add the agent and setup the node such that it’s online.

<img width="1797" height="485" alt="image" src="https://github.com/user-attachments/assets/3093f72b-0fc8-4424-a9c5-4785a9be4f03" />
<img width="2305" height="782" alt="image" src="https://github.com/user-attachments/assets/0ceab1a2-89cc-4a6d-bd55-30b560736582" />
<img width="1380" height="582" alt="image" src="https://github.com/user-attachments/assets/47cc1434-4787-427d-a32e-5cfbc0f0b70d" />
<img width="796" height="222" alt="image" src="https://github.com/user-attachments/assets/a03fe23f-ecc1-41da-a080-3543d3ebcf2c" />
<img width="967" height="1211" alt="image" src="https://github.com/user-attachments/assets/e0115d42-21c3-45a9-bb80-bc2c2aa4e1ea" />
<img width="2290" height="787" alt="image" src="https://github.com/user-attachments/assets/87427ec8-63ff-4151-91ff-4c82244490d7" />
<img width="851" height="851" alt="image" src="https://github.com/user-attachments/assets/40b0c72f-5dee-4ce0-991e-3233101b5913" />
<img width="322" height="215" alt="image" src="https://github.com/user-attachments/assets/3aed923b-c126-4728-9179-7c016a36304d" />
<img width="667" height="615" alt="image" src="https://github.com/user-attachments/assets/584b76e8-3d4e-4b1e-a272-ea2b44a83d36" />
<img width="2261" height="570" alt="image" src="https://github.com/user-attachments/assets/a1adc4d7-02a7-425e-af17-b227baa62877" />
<img width="2111" height="1101" alt="image" src="https://github.com/user-attachments/assets/30dd1758-a2aa-400e-bf17-46ff3b0d9843" />
<img width="962" height="615" alt="image" src="https://github.com/user-attachments/assets/f0ee6ec5-0b61-447c-a73e-61ce5bf7adc4" />



## Step-3: Create the Jenkins Job.

<img width="762" height="327" alt="image" src="https://github.com/user-attachments/assets/dfb16e14-e047-4291-b395-07dec82886bd" />
<img width="767" height="902" alt="image" src="https://github.com/user-attachments/assets/f3c5a439-5748-4fc5-9d68-f301c0c8c905" />
<img width="1226" height="547" alt="image" src="https://github.com/user-attachments/assets/12e4246f-4198-40da-ad8e-afb8bf269a4d" />
<img width="2516" height="885" alt="image" src="https://github.com/user-attachments/assets/9945810f-f277-421a-bb15-8fbfb5ed7059" />
<img width="715" height="567" alt="image" src="https://github.com/user-attachments/assets/46b22a14-f045-4716-83b6-2b0543332b29" />
<img width="1117" height="535" alt="image" src="https://github.com/user-attachments/assets/c865e28f-250b-4b84-9d0c-5713db8fa672" />
<img width="1322" height="697" alt="image" src="https://github.com/user-attachments/assets/241ee9b3-09ce-4aa9-af27-c622053663ac" />
<img width="2270" height="1201" alt="image" src="https://github.com/user-attachments/assets/bb072ed8-18e2-461e-9c4c-bc7faa4e40b9" />
<img width="1325" height="1206" alt="image" src="https://github.com/user-attachments/assets/8aeabf26-34a9-4c73-8e4e-f95c93e71563" />
<img width="1480" height="830" alt="image" src="https://github.com/user-attachments/assets/4a92ec2d-2f6f-4400-abc2-b27e62a52ac8" />
<img width="2291" height="1217" alt="image" src="https://github.com/user-attachments/assets/9a608f9e-e910-4971-b6ec-384e70cbb619" />



## Step-4: Validate if the changes in master are picked upon jenkins job trigger.

<img width="2356" height="1177" alt="image" src="https://github.com/user-attachments/assets/0148afd7-bc25-4ee7-ad1c-ab19520f7361" />
<img width="835" height="561" alt="image" src="https://github.com/user-attachments/assets/44a57360-d7b3-40d9-9ebf-b643482f01bc" />
<img width="1775" height="1170" alt="image" src="https://github.com/user-attachments/assets/e16392fc-32b6-44e6-9f6d-4b3116c710ec" />
<img width="587" height="310" alt="image" src="https://github.com/user-attachments/assets/874e9588-e88d-4d86-9a94-e097f5256f8e" />
<img width="2245" height="1126" alt="image" src="https://github.com/user-attachments/assets/593e6228-cc4c-4bda-8894-6b44a02c77c5" />
<img width="2035" height="1207" alt="image" src="https://github.com/user-attachments/assets/138a1a7f-43a9-42a6-8f11-e524b6175d1a" />
<img width="971" height="550" alt="image" src="https://github.com/user-attachments/assets/b6fb815e-0581-4113-8be2-e910932985eb" />
<img width="1290" height="491" alt="image" src="https://github.com/user-attachments/assets/ebfe8299-92c8-45b5-a157-95663e51d86e" />
<img width="865" height="545" alt="image" src="https://github.com/user-attachments/assets/c09c7eea-0ce3-4c90-b807-e9c5b5857eba" />
<img width="1082" height="827" alt="image" src="https://github.com/user-attachments/assets/856bffc5-08a9-44e2-90a6-94d2c2b99eac" />
<img width="2541" height="720" alt="image" src="https://github.com/user-attachments/assets/b423fbe7-a438-47d4-97ce-70c23f6f04d4" />
<img width="2530" height="1100" alt="image" src="https://github.com/user-attachments/assets/0cb8cec9-37df-4fe1-871e-e786279aec32" />
<img width="2536" height="692" alt="image" src="https://github.com/user-attachments/assets/1b0c83f3-a35d-4219-b036-40c8959cbde8" />
<img width="2541" height="827" alt="image" src="https://github.com/user-attachments/assets/3cc7cda7-5521-4da9-9fed-ff834793d0c7" />
<img width="1641" height="680" alt="image" src="https://github.com/user-attachments/assets/74badb38-023c-4be0-95e5-05c34fdd2c6e" />
<img width="1177" height="902" alt="image" src="https://github.com/user-attachments/assets/0ee9b46e-ec3f-4152-9302-0a1f3c6cbb8e" />
<img width="1802" height="1111" alt="image" src="https://github.com/user-attachments/assets/03d7fd03-1bf8-4ad7-b8b7-f6aee87a56a4" />
<img width="835" height="160" alt="image" src="https://github.com/user-attachments/assets/1db0c2bf-dbe4-4c49-a4d1-30a510387544" />
<img width="337" height="102" alt="image" src="https://github.com/user-attachments/assets/334367d2-a796-434f-bbab-d2018f2aa3c7" />





```sh
thor@jumphost ~$ ls
thor@jumphost ~$ ssh sarah@stapp01
The authenticity of host 'stapp01 (10.244.234.231)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
sarah@stapp01's password: 
Last login: Wed Jul  1 03:58:17 2026
[sarah@stapp01 ~]$ java --version
openjdk 11.0.20.1 2023-08-24 LTS
OpenJDK Runtime Environment (Red_Hat-11.0.20.1.1-2) (build 11.0.20.1+1-LTS)
OpenJDK 64-Bit Server VM (Red_Hat-11.0.20.1.1-2) (build 11.0.20.1+1-LTS, mixed mode, sharing)
[sarah@stapp01 ~]$ sudo yum install java-17-openjdk -y

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

For security reasons, the password you type will not be visible.

[sudo] password for sarah: 
CentOS Stream 9 - AppStream                                                                  29 MB/s |  28 MB     00:00    
CentOS Stream 9 - Extras packages                                                            55 kB/s |  21 kB     00:00    
Docker CE Stable - x86_64                                                                   1.1 MB/s |  80 kB     00:00    
Extra Packages for Enterprise Linux 9 - x86_64                                               29 MB/s |  21 MB     00:00    
Extra Packages for Enterprise Linux 9 openh264 (From Cisco) - x86_64                        4.2 kB/s | 2.5 kB     00:00    
Extra Packages for Enterprise Linux 9 - Next - x86_64                                       1.2 MB/s | 265 kB     00:00    
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
(1/2): java-17-openjdk-17.0.18.0.8-2.el9.x86_64.rpm                                         2.3 MB/s | 428 kB     00:00    
(2/2): java-17-openjdk-headless-17.0.18.0.8-2.el9.x86_64.rpm                                 53 MB/s |  44 MB     00:00    
----------------------------------------------------------------------------------------------------------------------------
Total                                                                                        46 MB/s |  45 MB     00:00     
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
[sarah@stapp01 ~]$ java --version
openjdk 17.0.18 2026-01-20 LTS
OpenJDK Runtime Environment (Red_Hat-17.0.18.0.8-2) (build 17.0.18+8-LTS)
OpenJDK 64-Bit Server VM (Red_Hat-17.0.18.0.8-2) (build 17.0.18+8-LTS, mixed mode, sharing)
[sarah@stapp01 ~]$ ls -la /var/www/html
total 1400
drwxr-xr-x 1 sarah sarah    4096 Jul  1 04:19 .
drwxr-xr-x 1 root  root     4096 Mar  5 14:50 ..
drwxr-xr-x 7 sarah sarah    4096 Jul  1 03:58 .git
-rw-r--r-- 1 sarah sarah      21 Jul  1 03:58 index.html
drwxr-xr-x 4 sarah sarah    4096 Jul  1 04:19 remoting
-rw-r--r-- 1 sarah sarah 1407915 Jul  1 04:19 remoting.jar
[sarah@stapp01 ~]$ cd /home/sarah/web
[sarah@stapp01 web]$ vi index.html

[No write since last change]
/bin/bash: line 1: q: command not found

shell returned 127

Press ENTER or type command to continue
[No write since last change]
/bin/bash: line 1: q: command not found

shell returned 127

Press ENTER or type command to continue
[1]+  Stopped                 vi index.html
[sarah@stapp01 web]$ cat index.html
Welcome to KodeKloud
[sarah@stapp01 web]$ vi index.html
[sarah@stapp01 web]$ cat index.html
Welcome to xFusionCorp Industries
[sarah@stapp01 web]$ git add .
[sarah@stapp01 web]$ git commit -m "Testing jenkins job"
[master 2100854] Testing jenkins job
 2 files changed, 1 insertion(+), 1 deletion(-)
 create mode 100644 .index.html.swp
[sarah@stapp01 web]$ ls -la
total 28
drwxr-xr-x 3 sarah sarah  4096 Jul  1 04:32 .
drwx------ 1 sarah sarah  4096 Jul  1 04:30 ..
drwxr-xr-x 7 sarah sarah  4096 Jul  1 04:33 .git
-rw-r--r-- 1 sarah sarah 12288 Jul  1 04:31 .index.html.swp
-rw-r--r-- 1 sarah sarah    34 Jul  1 04:32 index.html
[sarah@stapp01 web]$ sudo rm .index.html.swp 
[sudo] password for sarah: 
[sarah@stapp01 web]$ git add .
[sarah@stapp01 web]$ git commit -m "Testing jenkins job"
[master 45b24f9] Testing jenkins job
 1 file changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 .index.html.swp
[sarah@stapp01 web]$ git push origin master
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 16 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (6/6), 733 bytes | 733.00 KiB/s, done.
Total 6 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
remote: . Processing 1 references
remote: Processed 1 references in total
To http://gitea:3000/sarah/web.git
   ff3148b..45b24f9  master -> master
[sarah@stapp01 web]$ cat /var/www/html/index.html 
Welcome to xFusionCorp Industries
[sarah@stapp01 web]$

```

<img width="1967" height="1180" alt="image" src="https://github.com/user-attachments/assets/fb759377-6c64-4cc0-8eca-18e04b990805" />
<img width="1777" height="1157" alt="image" src="https://github.com/user-attachments/assets/96a1becd-9e80-4807-8ea2-b5f6a331da39" />
















