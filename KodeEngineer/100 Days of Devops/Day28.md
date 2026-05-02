# Day 28: Git Cherry Pick

<img width="812" height="385" alt="image" src="https://github.com/user-attachments/assets/bb69c82b-1c11-4785-a257-755c678d834d" />

The Nautilus application development team has been working on a project repository /opt/news.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. 
They recently shared the following requirements with the DevOps team:

There are two branches in this repository, master and feature. 
One of the developers is working on the feature branch and their work is still in progress, however they want to merge one of the commits from the feature branch to the master branch, 
the message for the commit that needs to be merged into master is Update info.txt. 
Accomplish this task for them, also remember to push your changes eventually.

<img width="676" height="932" alt="image" src="https://github.com/user-attachments/assets/a29e2ff2-0dd5-4f15-9366-12fc981f0ac8" />
<img width="686" height="715" alt="image" src="https://github.com/user-attachments/assets/b28eaf7e-ba25-4b11-953d-bc60ce74d944" />

<img width="895" height="673" alt="image" src="https://github.com/user-attachments/assets/f092e2db-85d4-4953-b412-fb23a45433c4" />
<img width="1632" height="862" alt="image" src="https://github.com/user-attachments/assets/13d281ad-4a8c-4c40-894e-5bdae11f99e2" />
<img width="896" height="345" alt="image" src="https://github.com/user-attachments/assets/76522cc3-0afa-49c7-853a-489b0821b8e4" />
<img width="1612" height="955" alt="image" src="https://github.com/user-attachments/assets/cef52827-c069-4c81-ac33-2e2d1e962d11" />


```sh
[natasha@ststor01 news]$ history
    1  cd /usr/src/kodekloudrepos/news.git
    2  cd /usr/src/kodekloudrepos/
    3  ls
    4  sudo git branch
    5  cd news/
    6  ls
    7  cd ..
    8  pwd
    9  cd news/
   10  ls -la
   11  git checkout feature
   12  sudo git checkout feature
   13  sudo git branch
   14  git log --oneline
   15  clear
   16  sudo git log --oneline
   17  git checkout master
   18  git cherry-pick c761b25
   19  sudo git cherry-pick c761b25
   20  sudo git push origin master
   21  history
[natasha@ststor01 news]$ 
```

<img width="1606" height="1072" alt="image" src="https://github.com/user-attachments/assets/079a72e3-aa25-4d31-96fa-c41f060db42e" />
<img width="2043" height="1132" alt="image" src="https://github.com/user-attachments/assets/07234c2b-cc26-4685-adba-46d2f7c75796" />

```sh
thor@jumphost ~$ ssh natasha@ststor01
The authenticity of host 'ststor01 (10.244.189.248)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ststor01' (ED25519) to the list of known hosts.
natasha@ststor01's password: 
[natasha@ststor01 ~]$ sudo git branch
fatal: not a git repository (or any of the parent directories): .git
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/
[natasha@ststor01 kodekloudrepos]$ sudo git branch
fatal: not a git repository (or any of the parent directories): .git
[natasha@ststor01 kodekloudrepos]$ ls -la
total 16
drwxr-xr-x 3 root root 4096 May  2 14:30 .
drwxr-xr-x 1 root root 4096 May  2 14:30 ..
drwxr-xr-x 3 root root 4096 May  2 14:30 news
[natasha@ststor01 kodekloudrepos]$ cd news/
[natasha@ststor01 news]$ sudo git branch
* feature
  master
[natasha@ststor01 news]$ pwd
/usr/src/kodekloudrepos/news
[natasha@ststor01 news]$ 


```

<img width="1897" height="656" alt="image" src="https://github.com/user-attachments/assets/43203462-113f-4135-84f1-8ff6a6c9eae1" />
<img width="972" height="757" alt="image" src="https://github.com/user-attachments/assets/5921a0b9-c84a-4eea-8496-b3eaedb1334d" />
<img width="1083" height="913" alt="image" src="https://github.com/user-attachments/assets/18e1b2b0-93a2-4861-b59d-ff8c312ad8bd" />
<img width="1092" height="442" alt="image" src="https://github.com/user-attachments/assets/4adce67e-22f2-46e5-a1d7-47ee56c78d6b" />

```sh
thor@jumphost ~$ ssh natasha@ststor01
The authenticity of host 'ststor01 (10.244.189.248)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ststor01' (ED25519) to the list of known hosts.
natasha@ststor01's password: 
[natasha@ststor01 ~]$ sudo git branch
fatal: not a git repository (or any of the parent directories): .git
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/
[natasha@ststor01 kodekloudrepos]$ sudo git branch
fatal: not a git repository (or any of the parent directories): .git
[natasha@ststor01 kodekloudrepos]$ ls -la
total 16
drwxr-xr-x 3 root root 4096 May  2 14:30 .
drwxr-xr-x 1 root root 4096 May  2 14:30 ..
drwxr-xr-x 3 root root 4096 May  2 14:30 news
[natasha@ststor01 kodekloudrepos]$ cd news/
[natasha@ststor01 news]$ sudo git branch
* feature
  master
[natasha@ststor01 news]$ pwd
/usr/src/kodekloudrepos/news
[natasha@ststor01 news]$ sudo git log feature
commit a39aced4f303de14c09e297e770c0130b5344154 (HEAD -> feature, origin/feature)
Author: Admin <admin@kodekloud.com>
Date:   Sat May 2 14:30:42 2026 +0000

    Update welcome.txt

commit 06813f6e64e1d813410d6b78bfc41118feb91932
Author: Admin <admin@kodekloud.com>
Date:   Sat May 2 14:30:42 2026 +0000

    Update info.txt

commit ecd5ab2a32f764fb2ac2aac2486878145b5ba563 (origin/master, master)
Author: Admin <admin@kodekloud.com>
Date:   Sat May 2 14:30:42 2026 +0000

    Add welcome.txt

commit e278324d6bcb3265a2b7afc7fb8921c150fc8f7c
Author: Admin <admin@kodekloud.com>
Date:   Sat May 2 14:30:42 2026 +0000

    initial commit
[natasha@ststor01 news]$ sudo git checkout master
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
[natasha@ststor01 news]$ sudo git cherry-pick 06813f6e64e1d813410d6b78bfc41118feb91932
[master 97cafbd] Update info.txt
 Date: Sat May 2 14:30:42 2026 +0000
 1 file changed, 1 insertion(+), 1 deletion(-)
[natasha@ststor01 news]$ sudo git push origin master
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 12 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 313 bytes | 313.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To /opt/news.git
   ecd5ab2..97cafbd  master -> master
[natasha@ststor01 news]$
```

<img width="1935" height="1147" alt="image" src="https://github.com/user-attachments/assets/c71a6bdd-754c-4ca6-b88c-1192ee1413c1" />
<img width="2092" height="1165" alt="image" src="https://github.com/user-attachments/assets/a0be49e2-b631-489b-87aa-ed0d28d38f29" />

```sh
[natasha@ststor01 news]$ history
    1  sudo git branch
    2  cd /usr/src/kodekloudrepos/
    3  sudo git branch
    4  ls -la
    5  cd news/
    6  sudo git branch
    7  pwd
    8  sudo git log feature
    9  sudo git checkout master
   10  sudo git cherry-pick 06813f6e64e1d813410d6b78bfc41118feb91932
   11  sudo git push origin master
   12  history
[natasha@ststor01 news]$

```
