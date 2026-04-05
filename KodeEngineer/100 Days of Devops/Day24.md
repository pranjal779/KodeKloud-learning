# Day 24: Git Create Branches

Nautilus developers are actively working on one of the project repositories, /usr/src/kodekloudrepos/demo. 
Recently, they decided to implement some new features in the application, and they want to maintain those new changes in a separate branch. 
Below are the requirements that have been shared with the DevOps team:

On Storage server in Stratos DC create a new branch xfusioncorp_demo from master branch in /usr/src/kodekloudrepos/demo git repo.

Please do not try to make any changes in the code.

<img width="892" height="435" alt="image" src="https://github.com/user-attachments/assets/bbd281a4-003c-4573-a41e-75fcaad12b35" />


```sh
thor@jumphost ~$ ssh natasha@ststor01
The authenticity of host 'ststor01 (10.244.49.60)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes  
Warning: Permanently added 'ststor01' (ED25519) to the list of known hosts.
natasha@ststor01's password: 
[natasha@ststor01 ~]$ git status
fatal: not a git repository (or any of the parent directories): .git
[natasha@ststor01 ~]$ /usr/src/kodekloudrepos/demo/
-bash: /usr/src/kodekloudrepos/demo/: Is a directory
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/demo/
[natasha@ststor01 demo]$ ls -la
total 20
drwxr-xr-x 3 root root 4096 Apr  5 17:52 .
drwxr-xr-x 3 root root 4096 Apr  5 17:52 ..
drwxr-xr-x 7 root root 4096 Apr  5 17:52 .git
-rw-r--r-- 1 root root   34 Apr  5 17:52 data.txt
-rw-r--r-- 1 root root   34 Apr  5 17:52 info.txt
[natasha@ststor01 demo]$ git status
fatal: detected dubious ownership in repository at '/usr/src/kodekloudrepos/demo'
To add an exception for this directory, call:

        git config --global --add safe.directory /usr/src/kodekloudrepos/demo
[natasha@ststor01 demo]$ git config --global --add safe.directory /usr/src/kodekloudrepos/
[natasha@ststor01 demo]$ 

[natasha@ststor01 demo]$ sudo chown -R natasha:natasha /usr/src/kodekloudrepos/demo
[natasha@ststor01 demo]$

[natasha@ststor01 demo]$ git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
[natasha@ststor01 demo]$ 

[natasha@ststor01 demo]$ git checkout -b xfusioncorp_demo
Switched to a new branch 'xfusioncorp_demo'
[natasha@ststor01 demo]$ 

[natasha@ststor01 demo]$ git branch
  kodekloud_demo
  master
* xfusioncorp_demo
[natasha@ststor01 demo]$ 

```
<img width="947" height="778" alt="image" src="https://github.com/user-attachments/assets/662ebd19-21ec-4b3b-988e-32377f409d46" />


Nautilus developers are actively working on one of the project repositories, /usr/src/kodekloudrepos/news. 
Recently, they decided to implement some new features in the application, and they want to maintain those new changes in a separate branch. 
Below are the requirements that have been shared with the DevOps team:

On Storage server in Stratos DC create a new branch xfusioncorp_news from master branch in /usr/src/kodekloudrepos/news git repo.

Please do not try to make any changes in the code.

<img width="851" height="437" alt="image" src="https://github.com/user-attachments/assets/2e33123b-4472-4a03-8cf7-b297fa615586" />

```sh
thor@jumphost ~$ ssh natasha@ststor01
The authenticity of host 'ststor01 (10.244.97.187)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ststor01' (ED25519) to the list of known hosts.
natasha@ststor01's password: 
[natasha@ststor01 ~]$ git config --global --add safe.directory /usr/src/kodekloudrepos/news
[natasha@ststor01 ~]$ sudo chown -R natasha:natasha /usr/src/kodekloudrepos/news
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/news
[natasha@ststor01 news]$ git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
[natasha@ststor01 news]$ git checkout -b xfusioncorp_news
Switched to a new branch 'xfusioncorp_news'
[natasha@ststor01 news]$ git branch
  kodekloud_news
  master
* xfusioncorp_news
[natasha@ststor01 news]$ 


```

<img width="2167" height="740" alt="image" src="https://github.com/user-attachments/assets/cd8ff071-3f32-4a88-a6c4-29d10f988fb4" />
<img width="2146" height="852" alt="image" src="https://github.com/user-attachments/assets/192b4407-1f15-4231-90bc-33956ed17de8" />

