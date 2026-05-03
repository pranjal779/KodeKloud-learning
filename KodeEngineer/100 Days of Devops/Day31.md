# Day 31: Git Stash

<img width="867" height="371" alt="image" src="https://github.com/user-attachments/assets/6e9f4131-bf6c-46b9-8bde-3869ad0b1a18" />

The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/apps present on Storage server in Stratos DC.  
One of the developers stashed some in-progress changes in this repository, but now they want to restore some of the stashed changes.   
Find below more details to accomplish this task:  
  
Look for the stashed changes under /usr/src/kodekloudrepos/apps git repository, and restore the stash with stash@{1} identifier.   
Further, commit and push your changes to the origin.   

<img width="677" height="847" alt="image" src="https://github.com/user-attachments/assets/e9b90240-26be-4a84-9e54-a0af417f68ad" />
<img width="696" height="782" alt="image" src="https://github.com/user-attachments/assets/c4ffb535-5a6f-4040-ba7e-a2eb1608454e" />
<img width="1671" height="857" alt="image" src="https://github.com/user-attachments/assets/569fd0cf-18dd-4907-94f3-f1de1c272c5f" />
<img width="927" height="461" alt="image" src="https://github.com/user-attachments/assets/28f157aa-6de0-4ebe-bcad-8ce6cb632ee0" />
<img width="1651" height="1147" alt="image" src="https://github.com/user-attachments/assets/453fa954-485b-4602-bf71-9d39283baf10" />


```sh
thor@jumphost ~$ cd /usr/src/kodekloudrepos/apps
bash: cd: /usr/src/kodekloudrepos/apps: No such file or directory
thor@jumphost ~$ sudo cd /usr/src/kodekloudrepos/apps
/bin/cd: line 2: cd: /usr/src/kodekloudrepos/apps: No such file or directory
thor@jumphost ~$ ssh natasha@ststor01
The authenticity of host 'ststor01 (10.244.97.141)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ststor01' (ED25519) to the list of known hosts.
natasha@ststor01's password: 
[natasha@ststor01 ~]$ sudo cd /usr/src/kodekloudrepos/apps
[natasha@ststor01 ~]$ git stash apply stash@{1}
fatal: not a git repository (or any of the parent directories): .git
[natasha@ststor01 ~]$ sudo git stash apply stash@{1}
fatal: not a git repository (or any of the parent directories): .git
[natasha@ststor01 ~]$ sudo git stash list
fatal: not a git repository (or any of the parent directories): .git
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/apps/
[natasha@ststor01 apps]$ sudo git stash apply stash@{1}
On branch master
Your branch is up to date with 'origin/master'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   welcome.txt

[natasha@ststor01 apps]$ sudo git add .
[natasha@ststor01 apps]$ sudo git commit -m "Restored stashed changes from stash@{1}"
[master 487df38] Restored stashed changes from stash@{1}
 1 file changed, 1 insertion(+)
 create mode 100644 welcome.txt
[natasha@ststor01 apps]$ git push origin master
fatal: detected dubious ownership in repository at '/usr/src/kodekloudrepos/apps'
To add an exception for this directory, call:

        git config --global --add safe.directory /usr/src/kodekloudrepos/apps
[natasha@ststor01 apps]$ sudo git push origin master
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 16 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 323 bytes | 323.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To /opt/apps.git
   4b6a6c6..487df38  master -> master
[natasha@ststor01 apps]$ 
```
<img width="662" height="771" alt="image" src="https://github.com/user-attachments/assets/9613f9ea-042f-4437-9192-2251c85606f2" />
