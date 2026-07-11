# Day 89: Ansible Manage Services

Developers are looking for dependencies to be installed and run on Nautilus app servers in Stratos DC. They have shared some requirements with the DevOps team. Because we are now managing packages installation and services management using Ansible, some playbooks need to be created and tested. As per details mentioned below please complete the task:

a. On jump host create an Ansible playbook /home/thor/ansible/playbook.yml and configure it to install httpd on all app servers.

b. After installation make sure to start and enable httpd service on all app servers.

c. The inventory /home/thor/ansible/inventory is already there on jump host.

d. Make sure user thor should be able to run the playbook on jump host.

Note: Validation will try to run playbook using command ansible-playbook -i inventory playbook.yml so please make sure playbook works this way, without passing any extra arguments.

<img width="537" height="1011" alt="image" src="https://github.com/user-attachments/assets/78f9a637-45bc-48ba-94ce-a9ec43985463" />

---

<img width="696" height="1012" alt="image" src="https://github.com/user-attachments/assets/fe43c071-b40d-44f6-95a0-d51d27f37b4d" />
<img width="902" height="272" alt="image" src="https://github.com/user-attachments/assets/936e8827-61ca-466b-abe6-dec34335c25c" />
<img width="1771" height="1092" alt="image" src="https://github.com/user-attachments/assets/ff77687e-5ffc-4d22-8e68-c4db7e82da57" />

# Step-3: Validate the execution of the playbook against the inventory file.

<img width="1807" height="1147" alt="image" src="https://github.com/user-attachments/assets/2236f138-9956-43dc-8798-99301e24df1d" />

<img width="1822" height="1107" alt="image" src="https://github.com/user-attachments/assets/e2f45a82-051d-43dc-9775-f6d6f7d2a90c" />
<img width="1787" height="1162" alt="image" src="https://github.com/user-attachments/assets/02a8f666-abe5-4970-af25-380f12d59de9" />


```sh
thor@jump-host ~$ ls -la /home/thor/ansible/inventory
-rw-r--r-- 1 thor thor 219 Jul 11 15:08 /home/thor/ansible/inventory
thor@jump-host ~$ cat /home/thor/ansible/inventory
stapp01 ansible_host=stapp01 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=stapp02 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=stapp03 ansible_ssh_pass=BigGr33n ansible_user=bannerthor@jump-host ~$ 
thor@jump-host ~$ 
thor@jump-host ~$ cd /home/thor/ansible/
thor@jump-host ~/ansible$ ls
ansible.cfg  inventory
thor@jump-host ~/ansible$ vi playbook.yml
thor@jump-host ~/ansible$ cat playbook.yml 
---
- name: Install and configure httpd
  hosts: all
  become: yes
  tasks:
    - name: Install httpd package
      yum:
        name: httpd
        state: latest

    - name: Start and enable httpd service
      service:
        name: httpd
        state: started
        enabled: yes
thor@jump-host ~/ansible$ cd ..
thor@jump-host ~$ cd ..
thor@jump-host /home$ cd ~
thor@jump-host ~$ ssh keygen -t rsa -b 4096
ssh: Could not resolve hostname keygen: Name or service not known
thor@jump-host ~$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/thor/.ssh/id_rsa): 
Created directory '/home/thor/.ssh'.
Enter passphrase for "/home/thor/.ssh/id_rsa" (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/thor/.ssh/id_rsa
Your public key has been saved in /home/thor/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:88L2OzUdNYtVpWEKXjFganD1Cvc1P5JwOW6Nc2c5L5A thor@jump-host
The key's randomart image is:
+---[RSA 4096]----+
|      . ..=.+.o =|
|       o + + +.=.|
|        + o.o+*.o|
|       . o o++*+.|
|        S . EO B+|
|       . o  +.=.=|
|        + .. .. .|
|       . o.    . |
|          oo     |
+----[SHA256]-----+
thor@jump-host ~$ 
thor@jump-host ~$ 
thor@jump-host ~$ ls -la .ssh
total 20
drwx------ 2 thor thor 4096 Jul 11 15:18 .
drwx------ 1 thor thor 4096 Jul 11 15:18 ..
-rw------- 1 thor thor 3381 Jul 11 15:18 id_rsa
-rw-r--r-- 1 thor thor  740 Jul 11 15:18 id_rsa.pub
thor@jump-host ~$ ssh-copy-id tony@stapp01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
The authenticity of host 'stapp01 (10.244.248.16)' can't be established.
ED25519 key fingerprint is SHA256:Bwpxy0ysVLdaJWDdYqzT3ALc0Sr1LyDBPJpRTr/L7aA.
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
The authenticity of host 'stapp02 (10.244.81.39)' can't be established.
ED25519 key fingerprint is SHA256:cTai/xpU0eBM8+EB4wGt2WP2v68+7y3RFH3bj5zb92s.
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
The authenticity of host 'stapp03 (10.244.164.6)' can't be established.
ED25519 key fingerprint is SHA256:14sh8kDHLRUyFYOQakbKWEu46OMG4+6H7jn7nEj+4L4.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
banner@stapp03's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'banner@stapp03'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~$ ssh tony@stapp01
^[[3~[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ sudo systemctl status htttpd
Unit htttpd.service could not be found.
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jump-host ~$ cd /home/thor/ansible/thor@jump-host ~/ansible$ ansible-playbook -i inventory playbook.yml

PLAY [Install and configure httpd] ***********************************************

TASK [Gathering Facts] ***********************************************************
ok: [stapp03]
ok: [stapp02]
ok: [stapp01]

TASK [Install httpd package] *****************************************************
changed: [stapp03]
changed: [stapp02]
changed: [stapp01]

TASK [Start and enable httpd service] ********************************************
changed: [stapp02]
changed: [stapp03]
changed: [stapp01]

PLAY RECAP ***********************************************************************
stapp01                    : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
stapp02                    : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
stapp03                    : ok=3    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ ssh tony@stapp01
Last login: Sat Jul 11 15:21:51 2026 from 10.244.81.42
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ sudo systemctl status httpd
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; preset: disa>
     Active: active (running) since Sat 2026-07-11 15:21:53 UTC; 45s ago
       Docs: man:httpd.service(8)
   Main PID: 32875 (httpd)
     Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes s>
      Tasks: 177 (limit: 404712)
     Memory: 14.9M
        CPU: 90ms
     CGroup: /system.slice/httpd.service
             ├─32875 /usr/sbin/httpd -DFOREGROUND
             ├─32976 /usr/sbin/httpd -DFOREGROUND
             ├─32979 /usr/sbin/httpd -DFOREGROUND
             ├─32982 /usr/sbin/httpd -DFOREGROUND
             └─32983 /usr/sbin/httpd -DFOREGROUND

Jul 11 15:21:53 stapp01 systemd[1]: Starting The Apache HTTP Server...
Jul 11 15:21:53 stapp01 httpd[32875]: AH00558: httpd: Could not reliably determin>
Jul 11 15:21:53 stapp01 httpd[32875]: Server configured, listening on: port 80
Jul 11 15:21:53 stapp01 systemd[1]: Started The Apache HTTP Server.
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jump-host ~/ansible$ ssh steve@stapp02
Last login: Sat Jul 11 15:21:51 2026 from 10.244.81.42
[steve@stapp02 ~]$ sudo systemctl status
● stapp02
    State: degraded
    Units: 205 loaded (incl. loaded aliases)
     Jobs: 0 queued
   Failed: 4 units
    Since: Sat 2026-07-11 13:41:33 UTC; 1h 47min ago
  systemd: 252-38.el9
   CGroup: /
           ├─init.scope
           │ ├─ 1 /usr/sbin/init
           │ └─60 /usr/bin/ttyd -p 8080 --ping-interval 30 -t fontSize=16 -t "the>
           ├─system.slice
           │ ├─dbus-broker.service
           │ │ ├─1315 /usr/bin/dbus-broker-launch --scope system --audit
           │ │ └─1391 dbus-broker --log 4 --controller 9 --machine-id 17bbbf8f4f8>
           │ ├─httpd.service
           │ │ ├─33690 /usr/sbin/httpd -DFOREGROUND
           │ │ ├─33886 /usr/sbin/httpd -DFOREGROUND
           │ │ ├─33891 /usr/sbin/httpd -DFOREGROUND
           │ │ ├─33895 /usr/sbin/httpd -DFOREGROUND
           │ │ └─33898 /usr/sbin/httpd -DFOREGROUND
           │ ├─rtkit-daemon.service
           │ │ └─1147 /usr/libexec/rtkit-daemon
           │ ├─sshd.service
           │ │ └─1653 "sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups"
           │ ├─systemd-hostnamed.service
           │ │ └─53137 /usr/lib/systemd/systemd-hostnamed
           │ ├─systemd-journald.service
           │ │ └─343 /usr/lib/systemd/systemd-journald
           │ ├─systemd-logind.service
           │ │ └─1204 /usr/lib/systemd/systemd-logind
           │ ├─systemd-udevd.service
           │ │ └─1023 /usr/lib/systemd/systemd-udevd
           │ └─upower.service
           │   └─1264 /usr/libexec/upowerd
           └─user.slice
             └─user-1000.slice
[steve@stapp02 ~]$ sudo systemctl status httpd
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; preset: disa>
     Active: active (running) since Sat 2026-07-11 15:21:52 UTC; 7min ago
       Docs: man:httpd.service(8)
   Main PID: 33690 (httpd)
     Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes s>
      Tasks: 177 (limit: 404712)
     Memory: 14.9M
        CPU: 307ms
     CGroup: /system.slice/httpd.service
             ├─33690 /usr/sbin/httpd -DFOREGROUND
             ├─33886 /usr/sbin/httpd -DFOREGROUND
             ├─33891 /usr/sbin/httpd -DFOREGROUND
             ├─33895 /usr/sbin/httpd -DFOREGROUND
             └─33898 /usr/sbin/httpd -DFOREGROUND

Jul 11 15:21:52 stapp02 systemd[1]: Starting The Apache HTTP Server...
Jul 11 15:21:52 stapp02 httpd[33690]: AH00558: httpd: Could not reliably determin>
Jul 11 15:21:52 stapp02 httpd[33690]: Server configured, listening on: port 80
Jul 11 15:21:52 stapp02 systemd[1]: Started The Apache HTTP Server.
[steve@stapp02 ~]$ 


```



<img width="2205" height="1152" alt="image" src="https://github.com/user-attachments/assets/a749ea2c-8303-43e6-a26a-6b5274db40ae" />

<img width="2125" height="1162" alt="image" src="https://github.com/user-attachments/assets/ce165e42-d801-4b4e-9774-ee75fb6163e1" />



