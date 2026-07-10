<img width="2347" height="1180" alt="image" src="https://github.com/user-attachments/assets/ceb8d479-7ed5-4f4c-8d20-d4e41b020fdc" /># Day 85: Create Files on App Servers using Ansible

The Nautilus DevOps team is testing various Ansible modules on servers in Stratos DC. They're currently focusing on file creation on remote hosts using Ansible. Here are the details:

a. Create an inventory file ~/playbook/inventory on jump host and include all app servers.

b. Create a playbook ~/playbook/playbook.yml to create a blank file /usr/src/nfsshare.txt on all app servers.

c. Set the permissions of the /usr/src/nfsshare.txt file to 0755.

d. Ensure the user/group owner of the /usr/src/nfsshare.txt file is tony on app server 1, steve on app server 2 and banner on app server 3.

Note: Validation will execute the playbook using the command ansible-playbook -i inventory playbook.yml, so ensure the playbook functions correctly without any additional arguments.

<img width="862" height="847" alt="image" src="https://github.com/user-attachments/assets/db6fb3f8-ae79-406e-9d73-67232b1f21fd" />

---


<img width="1836" height="1182" alt="image" src="https://github.com/user-attachments/assets/522622a6-471d-4d90-a2ad-9f0ab0c7e24c" />
<img width="2202" height="1212" alt="image" src="https://github.com/user-attachments/assets/9f2b66cf-7d68-4f5a-bc70-506f0821942f" />


### Step-3: Create the playbook file.

<img width="1835" height="1187" alt="image" src="https://github.com/user-attachments/assets/4ee19fda-1026-4698-ba84-3d477b68864a" />


```sh
thor@jump-host ~$ vi ~/playbook/playbook.yml
thor@jump-host ~$ cat ~/playbook/playbook.yml 
# Content of the playbook file:
---
- hosts: app_servers
  become: yes

  tasks:
    - name: Create empty file with proper permissions
      file:
        path: /usr/src/nfsshare.txt
        state: touch
        mode: '0755'
        owner: "{{ ansible_user }}"
        group: "{{ ansible_user }}"
thor@jump-host ~$

```


### Step-4: Validate the execution of the playbook against the inventory file.

<img width="2225" height="1185" alt="image" src="https://github.com/user-attachments/assets/42aea00b-9017-4031-9442-371c9a079117" />

<img width="2380" height="1167" alt="image" src="https://github.com/user-attachments/assets/d433774f-6ab0-4546-a7bb-15183ffc58cd" />
<img width="2372" height="1212" alt="image" src="https://github.com/user-attachments/assets/7a8ed579-976f-430b-be71-b6e1c91c9e69" />
<img width="2347" height="1180" alt="image" src="https://github.com/user-attachments/assets/883ff462-2fca-4ac7-9fea-465881553a2b" />


```sh
thor@jump-host ~$ ssh tony@stapp01
Last login: Fri Jul 10 12:49:53 2026 from 10.244.81.8
[tony@stapp01 ~]$ ls /usr/src
debug    linux-gcp-6.5-headers-6.5.0-1016  linux-headers-6.5.0-1016-gcp  linux-headers-6.8.0-94-generic
kernels  linux-gcp-6.8-headers-6.8.0-1026  linux-headers-6.8.0-1026-gcp  linux-hwe-6.8-headers-6.8.0-94
[tony@stapp01 ~]$ ls /usr/src/
debug    linux-gcp-6.5-headers-6.5.0-1016  linux-headers-6.5.0-1016-gcp  linux-headers-6.8.0-94-generic
kernels  linux-gcp-6.8-headers-6.8.0-1026  linux-headers-6.8.0-1026-gcp  linux-hwe-6.8-headers-6.8.0-94
[tony@stapp01 ~]$ ls -la /usr/src/
total 48
drwxr-xr-x  1 root root 4096 Jul 10 12:17 .
drwxr-xr-x  1 root root 4096 Jul  8  2024 ..
drwxr-xr-x  2 root root 4096 Jun 25  2024 debug
drwxr-xr-x  1 root root 4096 Jul 10 12:17 kernels
drwxr-xr-x  2 root root 4096 Jul 10  2024 linux-gcp-6.5-headers-6.5.0-1016
drwxr-xr-x  2 root root 4096 Feb 25 06:45 linux-gcp-6.8-headers-6.8.0-1026
drwxr-xr-x  2 root root 4096 Jul 10  2024 linux-headers-6.5.0-1016-gcp
drwxr-xr-x  2 root root 4096 Feb 25 06:45 linux-headers-6.8.0-1026-gcp
drwxr-xr-x  7 root root 4096 Feb  5 05:12 linux-headers-6.8.0-94-generic
drwxr-xr-x 26 root root 4096 Feb  5 05:12 linux-hwe-6.8-headers-6.8.0-94
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jump-host ~$ cd ~/playbook/
thor@jump-host ~/playbook$ ansible-playbook i inventory playbook.yml
ERROR! the playbook: i could not be found
thor@jump-host ~/playbook$ ansible-playbook -i inventory playbook.yml

PLAY [app_servers] *********************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************
ok: [stapp03]
ok: [stapp02]
ok: [stapp01]

TASK [Create empty file with proper permissions] ***************************************************************************
changed: [stapp02]
changed: [stapp01]
changed: [stapp03]

PLAY RECAP *****************************************************************************************************************
stapp01                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
stapp02                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
stapp03                    : ok=2    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

thor@jump-host ~/playbook$ exit
exit
thor@jump-host ~$ ssh tony@stapp01
Last login: Fri Jul 10 12:58:50 2026 from 10.244.81.8
[tony@stapp01 ~]$ ls -la /usr/src/
total 48
drwxr-xr-x  1 root root 4096 Jul 10 12:58 .
drwxr-xr-x  1 root root 4096 Jul  8  2024 ..
drwxr-xr-x  2 root root 4096 Jun 25  2024 debug
drwxr-xr-x  1 root root 4096 Jul 10 12:17 kernels
drwxr-xr-x  2 root root 4096 Jul 10  2024 linux-gcp-6.5-headers-6.5.0-1016
drwxr-xr-x  2 root root 4096 Feb 25 06:45 linux-gcp-6.8-headers-6.8.0-1026
drwxr-xr-x  2 root root 4096 Jul 10  2024 linux-headers-6.5.0-1016-gcp
drwxr-xr-x  2 root root 4096 Feb 25 06:45 linux-headers-6.8.0-1026-gcp
drwxr-xr-x  7 root root 4096 Feb  5 05:12 linux-headers-6.8.0-94-generic
drwxr-xr-x 26 root root 4096 Feb  5 05:12 linux-hwe-6.8-headers-6.8.0-94
-rwxr-xr-x  1 tony tony    0 Jul 10 12:58 nfsshare.txt
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jump-host ~$ ssh steve@stapp02
Last login: Fri Jul 10 12:58:50 2026 from 10.244.81.8
[steve@stapp02 ~]$ ls -la /usr/src/nfsshare.txt 
-rwxr-xr-x 1 steve steve 0 Jul 10 12:58 /usr/src/nfsshare.txt
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ eixt
-bash: eixt: command not found
[steve@stapp02 ~]$ exit
logout
Connection to stapp02 closed.
thor@jump-host ~$ ssh banner@stapp03
Last login: Fri Jul 10 12:58:50 2026 from 10.244.81.8
[banner@stapp03 ~]$ ls -la /usr/src/nfsshare.txt 
-rwxr-xr-x 1 banner banner 0 Jul 10 12:58 /usr/src/nfsshare.txt
[banner@stapp03 ~]$

```



<img width="2366" height="1180" alt="image" src="https://github.com/user-attachments/assets/ca7ca82f-5ccd-4e81-bd8d-52d606f11548" />

<img width="2407" height="1147" alt="image" src="https://github.com/user-attachments/assets/69c419f3-1de9-4676-9542-9cf020ed6708" />















