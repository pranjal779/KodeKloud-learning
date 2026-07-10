# Day 88: Ansible Blockinfile Module

The Nautilus DevOps team wants to install and set up a simple httpd web server on all app servers in Stratos DC. Additionally, they want to deploy a sample web page for now using Ansible only. Therefore, write the required playbook to complete this task. Find more details about the task below.

We already have an inventory file under /home/thor/ansible directory on jump host. Create a playbook.yml under /home/thor/ansible directory on jump host itself.

Using the playbook, install httpd web server on all app servers. Additionally, make sure its service should up and running.

Using blockinfile Ansible module add some content in /var/www/html/index.html file. Below is the content:

Welcome to XfusionCorp!

This is  Nautilus sample file, created using Ansible!

Please do not modify this file manually!


The /var/www/html/index.html file's user and group owner should be apache on all app servers.

The /var/www/html/index.html file's permissions should be 0777 on all app servers.

Note:

i. Validation will try to run the playbook using command ansible-playbook -i inventory playbook.yml so please make sure the playbook works this way without passing any extra arguments.
ii. Do not use any custom or empty marker for blockinfile module.

<img width="832" height="1132" alt="image" src="https://github.com/user-attachments/assets/8a223457-bcf5-4eac-b28a-091c4442b90d" />

---

What is the blockinfile module and what is it’s purpose?
The blockinfile module in Ansible is used to insert, update, or manage a specific block of text inside a file. Its purpose is to safely manage only a particular section of a file without overwriting the entire file.


This is safer because:  
- Existing content stays intact.
- Repeated runs don’t duplicate content.
- Ansible can easily update/remove its own block later.

Some of the common real-world usage of this module are:  
- Adding config snippets.
- Inserting environment variables.
- Managing SSH configs.
- Updating web pages.
- Modifying application configs safely.

---

### Step-1: Verify the existing inventory file.

<img width="2250" height="1290" alt="image" src="https://github.com/user-attachments/assets/58974701-567c-46d4-90a7-07f712c16977" />


### Step-2: Create the playbook with the defined requirements.

<img width="1882" height="1375" alt="image" src="https://github.com/user-attachments/assets/15967559-f28a-49c5-950d-0e77d2f1a5f6" />


```sh
thor@jump-host ~/ansible$ vi playbook.yml
thor@jump-host ~/ansible$ cat playbook.yml 
---
- hosts: all
  become: yes
  tasks:
    - name: Install httpd package.
      yum:
        name: httpd
        state: present
    - name: Starting the httpd service.
      service:
        name: httpd
        state: started
        enabled: yes
    - name: Using the blockinfile module
      ansible.builtin.blockinfile:
        path: /var/www/html/index.html
        create: yes
        block: |
          Welcome to XfusionCorp!

          This is Nautilus sample file, created using Ansible!

          Please do not modify this file manually!
        mode: '0777'
        owner: "apache"
        group: "apache"
thor@jump-host ~/ansible$ 

```


### Step-3: Validate the execution of the playbook against the inventory file.

<img width="1207" height="1137" alt="image" src="https://github.com/user-attachments/assets/c447b63a-d225-4103-86ae-ce037d598e84" />
<img width="1377" height="1201" alt="image" src="https://github.com/user-attachments/assets/625f4459-08bf-4fdc-b6d1-98f5f0a5c6be" />
<img width="1342" height="450" alt="image" src="https://github.com/user-attachments/assets/862653e5-103d-4cb8-9291-7cd37bd3cf22" />
<img width="2377" height="1162" alt="image" src="https://github.com/user-attachments/assets/ecef2ff8-9be5-4733-b32f-4c85344620b1" />
<img width="2032" height="1197" alt="image" src="https://github.com/user-attachments/assets/d1aa88e7-fc36-415b-a6df-3e9569b095d4" />



```sh

thor@jump-host ~$ cd /home/thor/ansible/
thor@jump-host ~/ansible$ ls -la
total 20
drwxr-xr-x 2 thor thor 4096 Jul 10 18:35 .
drwx------ 1 thor thor 4096 Jul 10 18:35 ..
-rw-r--r-- 1 thor thor   36 Jul 10 18:35 ansible.cfg
-rw-r--r-- 1 thor thor  219 Jul 10 18:35 inventory
thor@jump-host ~/ansible$ cat inventory 
stapp01 ansible_host=stapp01 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=stapp02 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=stapp03 ansible_ssh_pass=BigGr33n ansible_user=bannerthor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ cat ansible.cfg 
[defaults]
host_key_checking = Falsethor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ vi playbook.yml
thor@jump-host ~/ansible$ cat playbook.yml 
---
- hosts: all
  become: yes
  tasks:
    - name: Install httpd package.
      yum:
        name: httpd
        state: present
    - name: Starting the httpd service.
      service:
        name: httpd
        state: started
        enabled: yes
    - name: Using the blockinfile module
      ansible.builtin.blockinfile:
        path: /var/www/html/index.html
        create: yes
        block: |
          Welcome to XfusionCorp!

          This is Nautilus sample file, created using Ansible!

          Please do not modify this file manually!
        mode: '0777'
        owner: "apache"
        group: "apache"
thor@jump-host ~/ansible$ ssh tony@stapp01
The authenticity of host 'stapp01 (10.244.13.24)' can't be established.
ED25519 key fingerprint is SHA256:saBr8s3sZQOpwZ833E6nliqe4Sj1nG4OfGywyDDIWPs.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
Permission denied, please try again.
tony@stapp01's password: 
Last failed login: Fri Jul 10 18:48:41 UTC 2026 from 10.244.13.7 on ssh:notty
There was 1 failed login attempt since the last successful login.
[tony@stapp01 ~]$ ls -la /var/www/html/
ls: cannot access '/var/www/html/': No such file or directory
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jump-host ~/ansible$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/thor/.ssh/id_rsa): 
Enter passphrase for "/home/thor/.ssh/id_rsa" (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/thor/.ssh/id_rsa
Your public key has been saved in /home/thor/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:xWQWBZ96bgsK1rEuylLB2HKRnkNocB+ascUe+Awkxhs thor@jump-host
The key's randomart image is:
+---[RSA 4096]----+
|++++o.    *+.    |
|.E=B*.   = . .   |
| .*@.+    o o    |
| .o %    . .     |
|   o o  S . .    |
|    .  . o o     |
|   .  o o . o    |
|  .. ..o . o .   |
|   .o. .o   .    |
+----[SHA256]-----+
thor@jump-host ~/ansible$ ls -la .ssh
ls: cannot access '.ssh': No such file or directory
thor@jump-host ~/ansible$ cd ..
thor@jump-host ~$ cd ..
thor@jump-host /home$ cd ..
thor@jump-host /$ cd ..
thor@jump-host /$ cd ~
thor@jump-host ~$ exit
exit
thor@jump-host ~$ ls
ansible
thor@jump-host ~$ ls -la .ssh
total 28
drwx------ 2 thor thor 4096 Jul 10 18:50 .
drwx------ 1 thor thor 4096 Jul 10 18:50 ..
-rw------- 1 thor thor 3381 Jul 10 18:50 id_rsa
-rw-r--r-- 1 thor thor  740 Jul 10 18:50 id_rsa.pub
-rw------- 1 thor thor  819 Jul 10 18:48 known_hosts
-rw-r--r-- 1 thor thor   89 Jul 10 18:48 known_hosts.old
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
The authenticity of host 'stapp02 (10.244.13.86)' can't be established.
ED25519 key fingerprint is SHA256:cirotSlybjkw3Pk4n2s9ThQHhvYwRcu86FPzlXb7Jr0.
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
The authenticity of host 'stapp03 (10.244.244.165)' can't be established.
ED25519 key fingerprint is SHA256:8e50bre2riK+kommHa892LSfU8T6P5CtMeTdxSE+Rr4.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
banner@stapp03's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'banner@stapp03'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~$ cd /home/thor/ansible/
thor@jump-host ~/ansible$ ansible-playbook -i inventory playbook.yml

PLAY [all] *****************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************
ok: [stapp03]
ok: [stapp01]
ok: [stapp02]

TASK [Install httpd package.] **********************************************************************************************
changed: [stapp02]
changed: [stapp03]
changed: [stapp01]

TASK [Starting the httpd service.] *****************************************************************************************
changed: [stapp02]
changed: [stapp01]
changed: [stapp03]

TASK [Using the blockinfile module] ****************************************************************************************
changed: [stapp01]
changed: [stapp02]
changed: [stapp03]

PLAY RECAP *****************************************************************************************************************
stapp01                    : ok=4    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
stapp02                    : ok=4    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
stapp03                    : ok=4    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

thor@jump-host ~/ansible$ ssh tony@stapp01
Last login: Fri Jul 10 18:53:41 2026 from 10.244.13.7
[tony@stapp01 ~]$ ls -la /var/www/html/
total 12
drwxr-xr-x 2 root   root   4096 Jul 10 18:53 .
drwxr-xr-x 4 root   root   4096 Jul 10 18:53 ..
-rwxrwxrwx 1 apache apache  178 Jul 10 18:53 index.html
[tony@stapp01 ~]$ cat /var/www/html/index.html 
# BEGIN ANSIBLE MANAGED BLOCK
Welcome to XfusionCorp!

This is Nautilus sample file, created using Ansible!

Please do not modify this file manually!
# END ANSIBLE MANAGED BLOCK
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jump-host ~/ansible$ ssh steve@stapp02
Last login: Fri Jul 10 18:53:41 2026 from 10.244.13.7
[steve@stapp02 ~]$ ls -la /var/www/html/
total 12
drwxr-xr-x 2 root   root   4096 Jul 10 18:53 .
drwxr-xr-x 4 root   root   4096 Jul 10 18:53 ..
-rwxrwxrwx 1 apache apache  178 Jul 10 18:53 index.html
[steve@stapp02 ~]$ cat /var/www/html/index.html 
# BEGIN ANSIBLE MANAGED BLOCK
Welcome to XfusionCorp!

This is Nautilus sample file, created using Ansible!

Please do not modify this file manually!
# END ANSIBLE MANAGED BLOCK
[steve@stapp02 ~]$ exit
logout
Connection to stapp02 closed.
thor@jump-host ~/ansible$ ssh banner@stapp03
Last login: Fri Jul 10 18:53:41 2026 from 10.244.13.7
[banner@stapp03 ~]$ ls -la /var/www/html/
total 12
drwxr-xr-x 2 root   root   4096 Jul 10 18:53 .
drwxr-xr-x 4 root   root   4096 Jul 10 18:53 ..
-rwxrwxrwx 1 apache apache  178 Jul 10 18:53 index.html
[banner@stapp03 ~]$ cat /var/www/html/index.html 
# BEGIN ANSIBLE MANAGED BLOCK
Welcome to XfusionCorp!

This is Nautilus sample file, created using Ansible!

Please do not modify this file manually!
# END ANSIBLE MANAGED BLOCK
[banner@stapp03 ~]$ 
```


<img width="1866" height="1162" alt="image" src="https://github.com/user-attachments/assets/7bd3ddf2-9377-43b7-80ee-2c714b7aacc7" />

<img width="1890" height="1202" alt="image" src="https://github.com/user-attachments/assets/d23bac49-68d4-4886-94f7-38846dd667d8" />













