# Day 90: Managing ACLs Using Ansible

There are some files that need to be created on all app servers in Stratos DC. The Nautilus DevOps team want these files to be owned by user root only however, they also want that the app specific user to have a set of permissions on these files. All tasks must be done using Ansible only, so they need to create a playbook. Below you can find more information about the task.

Create a playbook named playbook.yml under /home/thor/ansible directory on jump host, an inventory file is already present under /home/thor/ansible directory on Jump Server itself.

Create an empty file blog.txt under /opt/itadmin/ directory on app server 1. Set some acl properties for this file. Using acl provide read '(r)' permissions to group tony (i.e entity is tony and etype is group).

Create an empty file story.txt under /opt/itadmin/ directory on app server 2. Set some acl properties for this file. Using acl provide read + write '(rw)' permissions to user steve (i.e entity is steve and etype is user).

Create an empty file media.txt under /opt/itadmin/ on app server 3. Set some acl properties for this file. Using acl provide read + write '(rw)' permissions to group banner (i.e entity is banner and etype is group).

Note: Validation will try to run the playbook using command ansible-playbook -i inventory playbook.yml so please make sure the playbook works this way, without passing any extra arguments.


<img width="806" height="1065" alt="image" src="https://github.com/user-attachments/assets/54a3f06d-6e82-4497-8f67-09ad87bf3651" />

---


<img width="587" height="1001" alt="image" src="https://github.com/user-attachments/assets/00a4bebf-d63f-4c58-904d-e2af9173951d" />
<img width="522" height="1036" alt="image" src="https://github.com/user-attachments/assets/55444db2-6c5a-454b-b16e-681ba9314055" />
<img width="556" height="537" alt="image" src="https://github.com/user-attachments/assets/0269946a-dcaa-425c-887c-7cff4a77dbf6" />
<img width="1771" height="1162" alt="image" src="https://github.com/user-attachments/assets/8f31bb55-978e-4229-a753-99141a49af68" />
<img width="1767" height="1167" alt="image" src="https://github.com/user-attachments/assets/455a8376-1e95-42c3-9441-2ef87bd7b32e" />
<img width="1756" height="1222" alt="image" src="https://github.com/user-attachments/assets/43878281-e411-494a-9ed8-002258401d9a" />


#### Step-3: Validate the execution of the playbook against the inventory file.

<img width="2392" height="1207" alt="image" src="https://github.com/user-attachments/assets/f27773fe-ba2d-4fd9-9721-ca2853321535" />
<img width="2356" height="1215" alt="image" src="https://github.com/user-attachments/assets/e6173e22-8e8b-4405-b7c5-666f2b6880a0" />

<img width="1872" height="1181" alt="image" src="https://github.com/user-attachments/assets/4593ff4c-fa95-4d71-8d3a-884de034ad3f" />
<img width="2315" height="1410" alt="image" src="https://github.com/user-attachments/assets/5a87d120-a635-42cc-a2ee-7a45696b6f6d" />
<img width="1812" height="1167" alt="image" src="https://github.com/user-attachments/assets/7b7d3a39-0705-429f-ba44-66c01529a4fb" />



```sh
thor@jump-host ~$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/thor/.ssh/id_rsa): 
Created directory '/home/thor/.ssh'.
Enter passphrase for "/home/thor/.ssh/id_rsa" (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/thor/.ssh/id_rsa
Your public key has been saved in /home/thor/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:nl+CLYlyWN4JQDvaS3WWfkktBnFKpyMmaRdz/SEefjQ thor@jump-host
The key's randomart image is:
+---[RSA 4096]----+
|    . o =oo      |
|   . o = B+.E    |
|    B = Bo+=.o   |
|   + B = +ooo    |
|  . o o S o.     |
|   . = = B       |
|    + + O o .    |
|     o   o o     |
|          .      |
+----[SHA256]-----+
thor@jump-host ~$ ls -la .ssh
total 20
drwx------ 2 thor thor 4096 Jul 11 15:39 .
drwx------ 1 thor thor 4096 Jul 11 15:39 ..
-rw------- 1 thor thor 3381 Jul 11 15:39 id_rsa
-rw-r--r-- 1 thor thor  740 Jul 11 15:39 id_rsa.pub
thor@jump-host ~$ cd /home/thor/ansible/
thor@jump-host ~/ansible$ ls -la
total 20
drwxr-xr-x 2 thor thor 4096 Jul 11 15:38 .
drwx------ 1 thor thor 4096 Jul 11 15:39 ..
-rw-r--r-- 1 thor thor   36 Jul 11 15:37 ansible.cfg
-rw-r--r-- 1 thor thor  219 Jul 11 15:37 inventory
thor@jump-host ~/ansible$ cat inventory 
stapp01 ansible_host=stapp01 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=stapp02 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=stapp03 ansible_ssh_pass=BigGr33n ansible_user=bannerthor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ cat ansible.cfg 
[defaults]
host_key_checking = Falsethor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ vi playbook.yml
thor@jump-host ~/ansible$ cat playbook.yml 
# Content for the task:
---
- hosts: stapp01
  become: yes
  tasks:
    - name: Create empty file
      file:
        path: /opt/itadmin/blog.txt
        state: touch

    - name: Set ACL for the group app server tony
      acl:
        path: /opt/itadmin/blog.txt
        entity: tony
        etype: group
        permissions: r
        state: present
- hosts: stapp02
  become: yes
  tasks:
    - name: Create empty file
      file:
        path: /opt/itadmin/story.txt
        state: touch
    - name: Set ACL for user steve
      acl:
        path: /opt/itadmin/story.txt
        entity: steve
        etype: user
        permissions: rw
        state: present
- hosts: stapp03
  become: yes
  tasks:
    - name: create empty file
      file:
        path: /opt/itadmin/media.txt
        state: touch
    - name: Set ACT for user banner
      acl:
        path: /opt/itadmin/media.txt
        entity: banner
        etype: user
        permissions: rw
        state: present
thor@jump-host ~/ansible$ cd ..
thor@jump-host ~$ ssh-copy-id tony@stapp01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
The authenticity of host 'stapp01 (10.244.240.135)' can't be established.
ED25519 key fingerprint is SHA256:JgHels9MhoJsyOw6+khZtESPfuToPU7DAo43bqeQ0eY.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
tony@stapp01's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'tony@stapp01'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~$ ssh-copy-id steve@stapp02
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
The authenticity of host 'stapp02 (10.244.29.246)' can't be established.
ED25519 key fingerprint is SHA256:SENGXLseZVYhRBzwc2FaKSxUw5l1ernxYNWi98RSkD0.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
steve@stapp02's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'steve@stapp02'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~$ ssh-copy-id banner@stapp03
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
The authenticity of host 'stapp03 (10.244.81.8)' can't be established.
ED25519 key fingerprint is SHA256:S/bJULAeLZQQ5nhwf8CvplkdK31UeJYQGrFuTaelOsQ.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
banner@stapp03's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'banner@stapp03'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~$ ssh tony@stapp01
[tony@stapp01 ~]$ ls -la /opt/itadmin/
total 12
drwxr-xr-x 2 root root 4096 Jul 11 15:38 .
drwxr-xr-x 1 root root 4096 Jul 11 15:38 ..
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jump-host ~$ ssh steve@stapp02
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ ls -la /opt/itadmin/
total 12
drwxr-xr-x 2 root root 4096 Jul 11 15:38 .
drwxr-xr-x 1 root root 4096 Jul 11 15:38 ..
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ exit
logout
Connection to stapp02 closed.
thor@jump-host ~$ 
thor@jump-host ~$ cd /home/thor/ansible/
thor@jump-host ~/ansible$ ansible-playbook -i inventory playbook.yml

PLAY [stapp01] *************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************
ok: [stapp01]

TASK [Create empty file] ***************************************************************************************
changed: [stapp01]

TASK [Set ACL for the group app server tony] *******************************************************************
changed: [stapp01]

PLAY [stapp02] *************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************
ok: [stapp02]

TASK [Create empty file] ***************************************************************************************
changed: [stapp02]

TASK [Set ACL for user steve] **********************************************************************************
changed: [stapp02]

PLAY [stapp03] *************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************
ok: [stapp03]

TASK [create empty file] ***************************************************************************************
changed: [stapp03]

TASK [Set ACT for user banner] *********************************************************************************
changed: [stapp03]

PLAY RECAP *****************************************************************************************************
stapp01                    : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
stapp02                    : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
stapp03                    : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

thor@jump-host ~/ansible$ ssh steve@stapp02
Last login: Sat Jul 11 16:04:49 2026 from 10.244.244.237
[steve@stapp02 ~]$ ls -la /opt/itadmin/
total 12
drwxr-xr-x  2 root root 4096 Jul 11 16:04 .
drwxr-xr-x  1 root root 4096 Jul 11 15:38 ..
-rw-rw-r--+ 1 root root    0 Jul 11 16:04 story.txt
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ cat /opt/itadmin/story.txt 
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ exit
logout
Connection to stapp02 closed.
thor@jump-host ~/ansible$ ssh tony@stapp01
Last login: Sat Jul 11 16:04:47 2026 from 10.244.244.237
[tony@stapp01 ~]$ ls -la /opt/itadmin/
total 12
drwxr-xr-x  2 root root 4096 Jul 11 16:04 .
drwxr-xr-x  1 root root 4096 Jul 11 15:38 ..
-rw-r--r--+ 1 root root    0 Jul 11 16:04 blog.txt
[tony@stapp01 ~]$ cat /opt/itadmin/blog.txt 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jump-host ~/ansible$ ssh banner@stapp03
Last login: Sat Jul 11 16:04:51 2026 from 10.244.244.237
[banner@stapp03 ~]$ ls -la /opt/itadmin/
total 12
drwxr-xr-x  2 root root 4096 Jul 11 16:04 .
drwxr-xr-x  1 root root 4096 Jul 11 15:38 ..
-rw-rw-r--+ 1 root root    0 Jul 11 16:04 media.txt
[banner@stapp03 ~]$ cat /opt/itadmin/media.txt 
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ getfacl /opt/itadmin/media.txt 
getfacl: Removing leading '/' from absolute path names
# file: opt/itadmin/media.txt
# owner: root
# group: root
user::rw-
user:banner:rw-
group::r--
mask::rw-
other::r--

[banner@stapp03 ~]$

```

<img width="1737" height="1160" alt="image" src="https://github.com/user-attachments/assets/e49e2d57-5c37-40e4-9a77-0dcc65e8b090" />
<img width="2337" height="1172" alt="image" src="https://github.com/user-attachments/assets/93514731-d6ef-4b46-9055-9417f2689d79" />


- it seems like you haven't set acl '/opt/itadmin/media.txt' properly on stapp03














