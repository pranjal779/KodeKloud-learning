# Day 25: Git Merge Branches

The Nautilus application development team has been working on a project repository /opt/apps.git.  
This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC.  
They recently shared the following requirements with DevOps team:  

Create a new branch devops in /usr/src/kodekloudrepos/apps repo from master and copy the /tmp/index.html file (present on storage server itself) into the repo.   
Further, add/commit this file in the new branch and merge back that branch into master branch. Finally, push the changes to the origin for both of the branches.  

<img width="985" height="577" alt="image" src="https://github.com/user-attachments/assets/adc3be39-36ca-4226-a9d5-2dc9c4870b2e" />

<img width="2123" height="1192" alt="image" src="https://github.com/user-attachments/assets/83737abd-17e2-4cc2-90e6-9c8ab64e630d" />
<img width="2132" height="1162" alt="image" src="https://github.com/user-attachments/assets/285a08e3-1478-4444-868a-c5081de1fbe3" />
<img width="2166" height="1165" alt="image" src="https://github.com/user-attachments/assets/6973e7bf-470f-4c5f-b629-bc757306e98f" />
<img width="2277" height="1177" alt="image" src="https://github.com/user-attachments/assets/7e24e449-aeda-4312-b245-98c13fc4a9f9" />
<img width="2290" height="1166" alt="image" src="https://github.com/user-attachments/assets/5af23b5e-68e3-40cf-b89b-ce68945c0882" />

```sh

[natasha@ststor01 apps]$ sudo git merge devops
Updating 5759daf..5c294c2
Fast-forward
 index.html | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 index.html
[natasha@ststor01 apps]$ sudo git push origin master
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To /opt/apps.git
   5759daf..5c294c2  master -> master
[natasha@ststor01 apps]$ git status
fatal: detected dubious ownership in repository at '/usr/src/kodekloudrepos/apps'
To add an exception for this directory, call:

        git config --global --add safe.directory /usr/src/kodekloudrepos/apps
[natasha@ststor01 apps]$ sudo git status
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
[natasha@ststor01 apps]$ sudo git log
commit 5c294c2500bc99d21c89074d1b06d1f9fcacd12f (HEAD -> master, origin/master, origin/devops, devops)
Author: Admin <admin@kodekloud.com>
Date:   Thu Apr 16 14:01:57 2026 +0000

    added Index.html file

commit 5759dafe666446472fb763349746b9fbda7bd978
Author: Admin <admin@kodekloud.com>
Date:   Thu Apr 16 13:52:46 2026 +0000

    initial commit
[natasha@ststor01 apps]$ 

```

<img width="2290" height="1166" alt="image" src="https://github.com/user-attachments/assets/ae4930d9-a424-4f46-969a-73ed429eb3d2" />
