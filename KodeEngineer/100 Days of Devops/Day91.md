# Day 91: Ansible Lineinfile Module

The Nautilus DevOps team want to install and set up a simple httpd web server on all app servers in Stratos DC. They also want to deploy a sample web page using Ansible. Therefore, write the required playbook to complete this task as per details mentioned below.

We already have an inventory file under /home/thor/ansible directory on jump host. Write a playbook playbook.yml under /home/thor/ansible directory on jump host itself. Using the playbook perform below given tasks:

Install httpd web server on all app servers, and make sure its service is up and running.

Create a file /var/www/html/index.html with content:

This is a Nautilus sample file, created using Ansible!

Using lineinfile Ansible module add some more content in /var/www/html/index.html file. Below is the content:

Welcome to Nautilus Group!

Also make sure this new line is added at the top of the file.

The /var/www/html/index.html file's user and group owner should be apache on all app servers.

The /var/www/html/index.html file's permissions should be 0644 on all app servers.

Note: Validation will try to run the playbook using command ansible-playbook -i inventory playbook.yml so please make sure the playbook works this way without passing any extra arguments.

<img width="880" height="1107" alt="image" src="https://github.com/user-attachments/assets/16d4b8d5-0e86-42d8-b33b-3dcf21306dea" />

---


### Step-2: Create the playbook with the defined requirements.


<img width="1807" height="1182" alt="image" src="https://github.com/user-attachments/assets/2b4161d7-bb47-4390-bb9c-bc15d2bcdd2a" />
<img width="2362" height="1172" alt="image" src="https://github.com/user-attachments/assets/437d3c71-8b6e-481b-819b-db944a7e7e17" />
<img width="2381" height="1181" alt="image" src="https://github.com/user-attachments/assets/4f6fc7e0-4323-4a89-a8ae-80894d19f23d" />
<img width="2357" height="1207" alt="image" src="https://github.com/user-attachments/assets/4879bb2e-3558-495c-b5d0-4dff0a826f4e" />
<img width="2377" height="1167" alt="image" src="https://github.com/user-attachments/assets/07cdc4d3-baef-494b-86ca-2b6af22be7f0" />
<img width="2372" height="1197" alt="image" src="https://github.com/user-attachments/assets/5a87f3be-b6e2-4b69-a184-53e37baaef07" />
<img width="2391" height="1187" alt="image" src="https://github.com/user-attachments/assets/18b59a68-bb43-455b-b926-3b157209dcab" />
<img width="2387" height="1167" alt="image" src="https://github.com/user-attachments/assets/9b6cc59b-7fef-4d87-badb-cb892d14d7b1" />




```sh
thor@jump-host ~$ ls -la /home/thor/ansible/
total 20
drwxr-xr-x 2 thor thor 4096 Jul 12 17:54 .
drwx------ 1 thor thor 4096 Jul 12 17:54 ..
-rw-r--r-- 1 thor thor   36 Jul 12 17:54 ansible.cfg
-rw-r--r-- 1 thor thor  219 Jul 12 17:54 inventory
thor@jump-host ~$ cd /home/thor/ansible/
thor@jump-host ~/ansible$ cat inventory 
stapp01 ansible_host=stapp01 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=stapp02 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=stapp03 ansible_ssh_pass=BigGr33n ansible_user=bannerthor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/thor/.ssh/id_rsa): 
Created directory '/home/thor/.ssh'.
Enter passphrase for "/home/thor/.ssh/id_rsa" (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/thor/.ssh/id_rsa
Your public key has been saved in /home/thor/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:wvewkPZ2M2pcCRLYuHOJPiDHqhDOdxZniTm9sFz1BMc thor@jump-host
The key's randomart image is:
+---[RSA 4096]----+
|     +   .o.     |
|    o o  ..E     |
| .   o+oo o      |
|o + +B+B.  .     |
|o= o.o#.S. .     |
|oo .o* * +o      |
|o . o. .+.=      |
|.      .oo o     |
|       ..        |
+----[SHA256]-----+
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ vi playbook.yml
thor@jump-host ~/ansible$ cat playbook.yml 
# Content of the playbook.yml file.
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
    - name: Create index.html with initial content
      copy:
        dest: /var/www/html/index.html
        content: |
          This is a Nautilus sample file, created using Ansible!

    - name: Add welcome line at the top of file
      lineinfile:
        path: /var/www/html/index.html
        line: Welcome to Nautilus Group!
        insertbefore: BOF
        mode: '0644'
        owner: "apache"
        group: "apache"
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ ssh tony@staap01
ssh: Could not resolve hostname staap01: Name or service not known
thor@jump-host ~/ansible$ ssh-copy-id tony@staap01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed

/usr/bin/ssh-copy-id: ERROR: ssh: Could not resolve hostname staap01: Name or service not known

thor@jump-host ~/ansible$ ssh-copy-id tony@stapp01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
The authenticity of host 'stapp01 (10.244.244.175)' can't be established.
ED25519 key fingerprint is SHA256:WR38LSTYNPZ4y6wtB4JdmlRFWYRVbCSHuwFo2d6pNNI.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
tony@stapp01's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'tony@stapp01'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~/ansible$ ssh-copy-id steve@stapp02
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
The authenticity of host 'stapp02 (10.244.13.72)' can't be established.
ED25519 key fingerprint is SHA256:n2ZZKeFsr4IAwzn6Ut0rpHgakXCvjGuUQMo4C4R1pSA.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
steve@stapp02's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'steve@stapp02'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~/ansible$ ssh-copy-id banner@stapp03
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
The authenticity of host 'stapp03 (10.244.29.202)' can't be established.
ED25519 key fingerprint is SHA256:U6d+EGvR8W5ZEynt9x5tSvwgnaHM4mWnkGiq47yjOE4.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
banner@stapp03's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'banner@stapp03'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~/ansible$ ssh tony@stapp01
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ sudo systemctl status httpd
Unit httpd.service could not be found.
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ ls /var/www/html/index.html .
/var/www/html/index.html

.:
[tony@stapp01 ~]$ ls /var/www/html/index.html
/var/www/html/index.html
[tony@stapp01 ~]$ ls -la /var/www/html/index.html
-rw-r--r-- 1 root root 31 Jul 12 17:54 /var/www/html/index.html
[tony@stapp01 ~]$ cat /var/www/html/index.html
This is KodeKloud Ansible Lab ![tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ ansible-playbook -i inventory playbook.yml 

PLAY [all] *****************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************
ok: [stapp01]
ok: [stapp03]
ok: [stapp02]

TASK [Install httpd package.] **********************************************************************************************
changed: [stapp03]
changed: [stapp01]
changed: [stapp02]

TASK [Starting the httpd service.] *****************************************************************************************
changed: [stapp01]
changed: [stapp02]
changed: [stapp03]

TASK [Create index.html with initial content] ******************************************************************************
changed: [stapp03]
changed: [stapp01]
changed: [stapp02]

TASK [Add welcome line at the top of file] *********************************************************************************
changed: [stapp02]
changed: [stapp03]
changed: [stapp01]

PLAY RECAP *****************************************************************************************************************
stapp01                    : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
stapp02                    : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
stapp03                    : ok=5    changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ ssh tony@stapp01
Last login: Sun Jul 12 18:12:08 2026 from 10.244.234.209
[tony@stapp01 ~]$ sudo systemctl status httpd
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; preset: disabled)
     Active: active (running) since Sun 2026-07-12 18:12:04 UTC; 2min 20s ago
       Docs: man:httpd.service(8)
   Main PID: 34513 (httpd)
     Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
      Tasks: 177 (limit: 404712)
     Memory: 14.9M
        CPU: 139ms
     CGroup: /system.slice/httpd.service
             ├─34513 /usr/sbin/httpd -DFOREGROUND
             ├─34587 /usr/sbin/httpd -DFOREGROUND
             ├─34588 /usr/sbin/httpd -DFOREGROUND
             ├─34589 /usr/sbin/httpd -DFOREGROUND
             └─34590 /usr/sbin/httpd -DFOREGROUND

Jul 12 18:12:04 stapp01 systemd[1]: Starting The Apache HTTP Server...
Jul 12 18:12:04 stapp01 httpd[34513]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name>
Jul 12 18:12:04 stapp01 httpd[34513]: Server configured, listening on: port 80
Jul 12 18:12:04 stapp01 systemd[1]: Started The Apache HTTP Server.
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ cat /var/www/html/index.html 
Welcome to Nautilus Group!
This is a Nautilus sample file, created using Ansible!
[tony@stapp01 ~]$ ls -la /var/www/html/index.html 
-rw-r--r-- 1 apache apache 82 Jul 12 18:12 /var/www/html/index.html
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jump-host ~/ansible$ ssh steve@stapp02
Last login: Sun Jul 12 18:12:08 2026 from 10.244.234.209
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ sudo systemctl status httpd
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; preset: disabled)
     Active: active (running) since Sun 2026-07-12 18:12:04 UTC; 4min 23s ago
       Docs: man:httpd.service(8)
   Main PID: 20947 (httpd)
     Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
      Tasks: 177 (limit: 404712)
     Memory: 14.9M
        CPU: 201ms
     CGroup: /system.slice/httpd.service
             ├─20947 /usr/sbin/httpd -DFOREGROUND
             ├─21140 /usr/sbin/httpd -DFOREGROUND
             ├─21144 /usr/sbin/httpd -DFOREGROUND
             ├─21149 /usr/sbin/httpd -DFOREGROUND
             └─21150 /usr/sbin/httpd -DFOREGROUND

Jul 12 18:12:04 stapp02 systemd[1]: Starting The Apache HTTP Server...
Jul 12 18:12:04 stapp02 httpd[20947]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name>
Jul 12 18:12:04 stapp02 httpd[20947]: Server configured, listening on: port 80
Jul 12 18:12:04 stapp02 systemd[1]: Started The Apache HTTP Server.
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ cat /var/www/html/index.html
Welcome to Nautilus Group!
This is a Nautilus sample file, created using Ansible!
[steve@stapp02 ~]$ ls -la /var/www/html/index.html
-rw-r--r-- 1 apache apache 82 Jul 12 18:12 /var/www/html/index.html
[steve@stapp02 ~]$ exit
logout
Connection to stapp02 closed.
thor@jump-host ~/ansible$ ssh banner@stapp03
Last login: Sun Jul 12 18:12:07 2026 from 10.244.234.209
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ sudo systemctl status httpd
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; preset: disabled)
     Active: active (running) since Sun 2026-07-12 18:12:05 UTC; 5min ago
       Docs: man:httpd.service(8)
   Main PID: 36744 (httpd)
     Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
      Tasks: 177 (limit: 404712)
     Memory: 14.9M
        CPU: 245ms
     CGroup: /system.slice/httpd.service
             ├─36744 /usr/sbin/httpd -DFOREGROUND
             ├─36836 /usr/sbin/httpd -DFOREGROUND
             ├─36838 /usr/sbin/httpd -DFOREGROUND
             ├─36840 /usr/sbin/httpd -DFOREGROUND
             └─36842 /usr/sbin/httpd -DFOREGROUND

Jul 12 18:12:05 stapp03 systemd[1]: Starting The Apache HTTP Server...
Jul 12 18:12:05 stapp03 httpd[36744]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name>
Jul 12 18:12:05 stapp03 httpd[36744]: Server configured, listening on: port 80
Jul 12 18:12:05 stapp03 systemd[1]: Started The Apache HTTP Server.
[banner@stapp03 ~]$ cat /var/www/html/index.html 
Welcome to Nautilus Group!
This is a Nautilus sample file, created using Ansible!
[banner@stapp03 ~]$ ls -la /var/www/html/index.html 
-rw-r--r-- 1 apache apache 82 Jul 12 18:12 /var/www/html/index.html
[banner@stapp03 ~]$

```


<img width="2416" height="1196" alt="image" src="https://github.com/user-attachments/assets/c2048023-c7d9-4c5e-b9b1-7d8e8010640e" />

<img width="2386" height="1197" alt="image" src="https://github.com/user-attachments/assets/8e853993-4349-4164-a06e-dee0e0fc57ea" />















