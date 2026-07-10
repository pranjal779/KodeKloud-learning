# Day 87: Ansible Install Package


The Nautilus Application development team wanted to test some applications on app servers in Stratos Datacenter. They shared some pre-requisites with the DevOps team, and packages need to be installed on app servers. Since we are already using Ansible for automating such tasks, please perform this task using Ansible as per details mentioned below:

Create an inventory file /home/thor/playbook/inventory on jump host and add all app servers in it.

Create an Ansible playbook /home/thor/playbook/playbook.yml to install sqlite package on all  app servers using Ansible yum module.

Make sure user thor should be able to run the playbook on jump host.

Note: Validation will try to run playbook using command ansible-playbook -i inventory playbook.yml so please make sure playbook works this way, without passing any extra arguments.


<img width="857" height="626" alt="image" src="https://github.com/user-attachments/assets/01d14971-3acb-4031-b10a-1664b873c78e" />

---

<img width="1617" height="1192" alt="image" src="https://github.com/user-attachments/assets/6edc869a-d9a9-466d-b2ff-82768618d953" />
<img width="2137" height="1116" alt="image" src="https://github.com/user-attachments/assets/fcdf7884-780b-477b-b6d0-5e136a2a6d73" />
<img width="2355" height="1215" alt="image" src="https://github.com/user-attachments/assets/490a48ef-fa76-4e70-8467-82dabbe53050" />


### Step-3: Create the playbook file.

<img width="1535" height="1172" alt="image" src="https://github.com/user-attachments/assets/6d683112-8778-4cc1-bb27-4c265275c647" />

```sh
thor@jump-host ~/playbook$ vi playbook.yml
thor@jump-host ~/playbook$ cat playbook.yml 
---
- hosts: app_servers
  becomes: yes
  tasks:
    - name: Intall sqlite package
      yum:
        name: sqlite
        state: present
thor@jump-host ~/playbook$

```



### Step-4: Validate the execution of the playbook against the inventory file.

<img width="2212" height="1185" alt="image" src="https://github.com/user-attachments/assets/e25ae221-0df1-4160-8224-7d03f4b06592" />
<img width="1666" height="1170" alt="image" src="https://github.com/user-attachments/assets/df95e6d9-2051-4af8-a593-b9ea3ba5880f" />
<img width="2397" height="1202" alt="image" src="https://github.com/user-attachments/assets/eb128f21-d86c-45f6-af79-c3be65141f49" />

<img width="2405" height="1187" alt="image" src="https://github.com/user-attachments/assets/e2e80556-d8e1-4347-94b1-69f2a79d00e9" />



---


```sh

thor@jump-host ~$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/thor/.ssh/id_rsa): 
Enter passphrase for "/home/thor/.ssh/id_rsa" (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/thor/.ssh/id_rsa
Your public key has been saved in /home/thor/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:WZzJy7tnvyOr5o7Kn2oMvaD2+LiZWzdDbGqHZGtqC/U thor@jump-host
The key's randomart image is:
+---[RSA 4096]----+
|                 |
|         o o     |
|          *      |
|     .   + .     |
|  . o.+ S o      |
| . +o*.    .     |
|.  .E+=.  .      |
| .+X ++o o..+ .  |
| oX*o.++++=+.+oo |
+----[SHA256]-----+
thor@jump-host ~$ ls -la .ssh
total 24
drwx------ 2 thor thor 4096 Jul 10 15:47 .
drwx------ 1 thor thor 4096 Jul 10 15:46 ..
-rw------- 1 thor thor 3381 Jul 10 15:47 id_rsa
-rw-r--r-- 1 thor thor  740 Jul 10 15:47 id_rsa.pub
-rw-r--r-- 1 thor thor 3429 Jul 10 15:46 known_hosts
thor@jump-host ~$ ls -la /home/thor/playbook/inventory
ls: cannot access '/home/thor/playbook/inventory': No such file or directory
thor@jump-host ~$ vi /home/thor/playbook/inventory
thor@jump-host ~$ cat /home/thor/playbook/inventory 
[app-servers]
stapp01 ansible_host=stapp01 ansible_user=tony
stapp02 ansible_host=stapp02 ansible_user=steve
stapp03 ansible_host=stapp03 ansible_user=banner
thor@jump-host ~$ ssh-copy-id tony@stapp01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
tony@stapp01's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'tony@stapp01'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~$ ssh-copy-id steve@stapp02
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
steve@stapp02's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'steve@stapp02'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~$ ssh-copy-id banner@stapp03
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
banner@stapp03's password: 
Permission denied, please try again.
banner@stapp03's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'banner@stapp03'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~$ cd /home/thor/playbook/
thor@jump-host ~/playbook$ vi playbook.yml
thor@jump-host ~/playbook$ cat playbook.yml 
---
- hosts: app_servers
  becomes: yes
  tasks:
    - name: Intall sqlite package
      yum:
        name: sqlite
        state: present
thor@jump-host ~/playbook$ ssh tony@stapp01
[tony@stapp01 ~]$ sudo systemctl status sqlite
Unit sqlite.service could not be found.
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jump-host ~/playbook$ ansible-playbook -i inventory playbook.yml
[WARNING]: Invalid characters were found in group names but not replaced, use -vvvv to see details
ERROR! 'becomes' is not a valid attribute for a Play

The error appears to be in '/home/thor/playbook/playbook.yml': line 2, column 3, but may
be elsewhere in the file depending on the exact syntax problem.

The offending line appears to be:

---
- hosts: app_servers
  ^ here
thor@jump-host ~/playbook$ vi playbook.yml
thor@jump-host ~/playbook$ cat playbook.yml 
---
- hosts: app_servers
  become: yes
  tasks:
    - name: Intall sqlite package
      yum:
        name: sqlite
        state: present
thor@jump-host ~/playbook$ ansible-playbook -i inventory playbook.yml
[WARNING]: Invalid characters were found in group names but not replaced, use -vvvv to see details
[WARNING]: Could not match supplied host pattern, ignoring: app_servers

PLAY [app_servers] *********************************************************************************************************
skipping: no hosts matched

PLAY RECAP *****************************************************************************************************************

thor@jump-host ~/playbook$ 
thor@jump-host ~/playbook$ 
thor@jump-host ~/playbook$ cat inventory 
[app-servers]
stapp01 ansible_host=stapp01 ansible_user=tony
stapp02 ansible_host=stapp02 ansible_user=steve
stapp03 ansible_host=stapp03 ansible_user=banner
thor@jump-host ~/playbook$ ansible-playbook -i inventory playbook.yml
[WARNING]: Invalid characters were found in group names but not replaced, use -vvvv to see details
[WARNING]: Could not match supplied host pattern, ignoring: app_servers

PLAY [app_servers] *********************************************************************************************************
skipping: no hosts matched

PLAY RECAP *****************************************************************************************************************

thor@jump-host ~/playbook$ vi /home/thor/playbook/inventory
thor@jump-host ~/playbook$ cat /home/thor/playbook/inventory
[app_servers]
stapp01 ansible_host=stapp01 ansible_user=tony
stapp02 ansible_host=stapp02 ansible_user=steve
stapp03 ansible_host=stapp03 ansible_user=banner
thor@jump-host ~/playbook$ ansible-playbook -i inventory playbook.yml

PLAY [app_servers] *********************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************
ok: [stapp01]
ok: [stapp03]
ok: [stapp02]

TASK [Intall sqlite package] ***********************************************************************************************
changed: [stapp03]
changed: [stapp01]
changed: [stapp02]

PLAY RECAP *****************************************************************************************************************
stapp01                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
stapp02                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
stapp03                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

thor@jump-host ~/playbook$ ssh tony@stapp01
Last login: Fri Jul 10 16:03:49 2026 from 10.244.195.57
[tony@stapp01 ~]$ sudo systemctl status sqlite
Unit sqlite.service could not be found.
[tony@stapp01 ~]$ ^C
[tony@stapp01 ~]$ sqlite3 --version
3.34.1 2021-01-20 14:10:07 10e20c0b43500cfb9bbc0eaa061c57514f715d87238f4d835880cd846b9ealt1
[tony@stapp01 ~]$ which sqlite3
/usr/bin/sqlite3
[tony@stapp01 ~]$ 


```


<img width="2406" height="1222" alt="image" src="https://github.com/user-attachments/assets/2c0c3baf-c901-4365-b4f9-7c6c11877c13" />
<img width="2407" height="1177" alt="image" src="https://github.com/user-attachments/assets/13c4a9ae-7ae6-4551-84bf-63fafb616529" />








