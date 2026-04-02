# Day 21: Set Up Git Repository on Storage Server

The Nautilus development team has provided requirements to the DevOps team for a new application development project, 
specifically requesting the establishment of a Git repository. 
Follow the instructions below to create the Git repository on the Storage server in the Stratos DC:

Utilize yum to install the git package on the Storage Server.

Create a bare repository named /opt/blog.git (ensure exact name usage).

<img width="871" height="578" alt="image" src="https://github.com/user-attachments/assets/4e4b776d-ce66-4dba-86f3-76f1ca5ffcc4" />

```sh



[natasha@ststor01 ~]$ git --version
git version 2.52.0
[natasha@ststor01 ~]$ sudo git init --bare /opt/blog.git
hint: Using 'master' as the name for the initial branch. This default branch name
hint: will change to "main" in Git 3.0. To configure the initial branch name
hint: to use in all of your new repositories, which will suppress this warning,
hint: call:
hint:
hint:   git config --global init.defaultBranch <name>
hint:
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint:
hint:   git branch -m <name>
hint:
hint: Disable this message with "git config set advice.defaultBranchName false"
Initialized empty Git repository in /opt/blog.git/
[natasha@ststor01 ~]$
[natasha@ststor01 ~]$ ls -ld /opt/blog.git
drwxr-xr-x 6 root root 4096 Apr  2 04:26 /opt/blog.git
[natasha@ststor01 ~]$ ls /opt/blog.git
HEAD  config  description  hooks  info  objects  refs
[natasha@ststor01 ~]$


```

<img width="2316" height="1150" alt="image" src="https://github.com/user-attachments/assets/f1b01c7b-0e8b-4e66-a8dc-bb2f153736b3" />

<img width="2293" height="1130" alt="image" src="https://github.com/user-attachments/assets/42357cb6-b241-473d-9b0b-b90884875f01" />

<img width="947" height="666" alt="image" src="https://github.com/user-attachments/assets/4507734c-8371-478b-9b91-a50eaee61da1" />

<img width="956" height="616" alt="image" src="https://github.com/user-attachments/assets/b1dded52-3f8c-44e4-8dc1-51bd8cf2a2ef" />
