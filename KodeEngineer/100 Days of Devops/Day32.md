# Day 32: Git Rebase

<img width="952" height="520" alt="image" src="https://github.com/user-attachments/assets/d7f2d525-f7b4-48fa-8396-369e4a35583d" />

The Nautilus application development team has been working on a project repository /opt/official.git.  
This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC.   
They recently shared the following requirements with DevOps team:  

One of the developers is working on feature branch and their work is still in progress,   
however there are some changes which have been pushed into the master branch,   
the developer now wants to rebase the feature branch with the master branch without loosing any data from the feature branch,   
also they don't want to add any merge commit by simply merging the master branch into the feature branch. Accomplish this task as per requirements mentioned.  

Also remember to push your changes once done.  

<img width="1665" height="938" alt="image" src="https://github.com/user-attachments/assets/37b51340-b325-486e-bd4e-54b1dc69f2c5" />

<img width="846" height="477" alt="image" src="https://github.com/user-attachments/assets/37fa5aa3-cd8b-4b6e-b105-a0ec6b555382" />

```sh
The Nautilus application development team has been working on a project repository /opt/beta.git.
This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC.
They recently shared the following requirements with DevOps team:

One of the developers is working on feature branch and their work is still in progress,
however there are some changes which have been pushed into the master branch,
the developer now wants to rebase the feature branch with the master branch without loosing any data from the feature branch,
also they don't want to add any merge commit by simply merging the master branch into the feature branch. Accomplish this task as per requirements mentioned.

Also remember to push your changes once done.
```


<img width="1937" height="767" alt="image" src="https://github.com/user-attachments/assets/4c4d24ff-6e69-4e4d-a3ae-126463659e71" />
<img width="1931" height="1006" alt="image" src="https://github.com/user-attachments/assets/bf7cc11d-ef94-4f72-ae11-4e7dad7b8246" />

```sh
thor@jumphost ~$ ssh natasha@ststor01
The authenticity of host 'ststor01 (10.244.247.221)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ststor01' (ED25519) to the list of known hosts.
natasha@ststor01's password: 
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/
[natasha@ststor01 kodekloudrepos]$ ls
beta
[natasha@ststor01 kodekloudrepos]$ cd beta/
[natasha@ststor01 beta]$ ls
feature.txt  info.txt
[natasha@ststor01 beta]$ sudo git branch
* feature
  master
[natasha@ststor01 beta]$ sudo git checkout feature
Already on 'feature'
[natasha@ststor01 beta]$ sudo git rebase master
Successfully rebased and updated refs/heads/feature.
[natasha@ststor01 beta]$ sudo git log --oneline --graph --decorate
* 1179224 (HEAD -> feature) Add new feature
* 5e614ee (origin/master, master) Update info.txt
* f754008 initial commit
[natasha@ststor01 beta]$ sudo git push origin feature --force
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 16 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 297 bytes | 297.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To /opt/beta.git
 + 1e28b8c...1179224 feature -> feature (forced update)
[natasha@ststor01 beta]$

[natasha@ststor01 beta]$ history
    1  cd /usr/src/kodekloudrepos/
    2  ls
    3  cd beta/
    4  ls
    5  sudo git branch
    6  sudo git checkout feature
    7  sudo git rebase master
    8  sudo git log --oneline --graph --decorate
    9  sudo git push origin feature --force
   10  history
[natasha@ststor01 beta]$ 
```

<img width="917" height="682" alt="image" src="https://github.com/user-attachments/assets/0dd5d5ee-7902-41c2-84f5-875565a0e0d5" />
<img width="916" height="582" alt="image" src="https://github.com/user-attachments/assets/90cfc882-34a9-4ac3-9df6-ead420845509" />



