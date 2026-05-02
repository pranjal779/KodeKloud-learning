# Day 30: Git hard reset

<img width="820" height="527" alt="image" src="https://github.com/user-attachments/assets/c3a8cbc7-aca9-4522-adf0-60d2720e7d77" />

<img width="1938" height="526" alt="image" src="https://github.com/user-attachments/assets/8c39ab23-5b3e-4ad4-b820-f63c49625bd6" />
<img width="1640" height="787" alt="image" src="https://github.com/user-attachments/assets/63ddd5c6-879a-4554-a6ce-a52b954c9a0d" />
<img width="1017" height="982" alt="image" src="https://github.com/user-attachments/assets/211a5210-9485-450d-a981-817655e2ed27" />
<img width="697" height="577" alt="image" src="https://github.com/user-attachments/assets/3a3ab2f6-6492-43f8-9288-892584eb616b" />
<img width="536" height="123" alt="image" src="https://github.com/user-attachments/assets/28368d1e-6514-4597-8e99-704d218017d0" />


```sh
thor@jumphost ~$ ssh natasha@
^C
thor@jumphost ~$ ^C
thor@jumphost ~$ ssh natasha@ststor01
The authenticity of host 'ststor01 (10.244.247.219)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ststor01' (ED25519) to the list of known hosts.
natasha@ststor01's password: 
[natasha@ststor01 ~]$ cd /usr/src/kodekloudrepos/news/
[natasha@ststor01 news]$ suydo git log --oneline
-bash: suydo: command not found
[natasha@ststor01 news]$ sudo git log --oneline
228dd3c (HEAD -> master, origin/master) Test Commit10
aab31db Test Commit9
18a4afc Test Commit8
e2a5de2 Test Commit7
70f9571 Test Commit6
e8b5b4b Test Commit5
4207c1c Test Commit4
8849529 Test Commit3
d35ddb9 Test Commit2
9c9eb83 Test Commit1
fe8bc8b add data.txt file
577d03a initial commit
[natasha@ststor01 news]$ ls -la
total 20
drwxr-xr-x 3 root root 4096 May  2 15:07 .
drwxr-xr-x 3 root root 4096 May  2 15:07 ..
drwxr-xr-x 7 root root 4096 May  2 15:07 .git
-rw-r--r-- 1 root root   10 May  2 15:07 info.txt
-rw-r--r-- 1 root root   32 May  2 15:07 news.txt
[natasha@ststor01 news]$ sudo git reset --hard fe8bc8b
HEAD is now at fe8bc8b add data.txt file
[natasha@ststor01 news]$ sudo git log --oneline
fe8bc8b (HEAD -> master) add data.txt file
577d03a initial commit
[natasha@ststor01 news]$
```


<img width="977" height="471" alt="image" src="https://github.com/user-attachments/assets/bc25c625-2e5a-46eb-87a6-c957934920af" />
<img width="737" height="151" alt="image" src="https://github.com/user-attachments/assets/917c6f09-0b67-43a8-ba0f-a1ace66221d7" />
<img width="2153" height="1197" alt="image" src="https://github.com/user-attachments/assets/3b474f8d-feb2-47cb-9b20-399b62d0f2e4" />

```sh
[natasha@ststor01 news]$ history
    1  cd /usr/src/kodekloudrepos/news/
    2  suydo git log --oneline
    3  sudo git log --oneline
    4  ls -la
    5  sudo git reset --hard fe8bc8b
    6  sudo git --oneline
    7  sudo git log --oneline
    8  git push -f origin master
    9  sudo git push -f origin master
   10  history
[natasha@ststor01 news]$ 
```
<img width="2088" height="1155" alt="image" src="https://github.com/user-attachments/assets/bf60124d-5690-4e9d-904e-696b5b160bff" />

