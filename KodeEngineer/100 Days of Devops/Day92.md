# Day 92: Managing Jinja2 Templates Using Ansible

One of the Nautilus DevOps team members is working on to develop a role for httpd installation and configuration. Work is almost completed, however there is a requirement to add a jinja2 template for index.html file. Additionally, the relevant task needs to be added inside the role. The inventory file ~/ansible/inventory is already present on jump host that can be used. Complete the task as per details mentioned below:

a. Update ~/ansible/playbook.yml playbook to run the httpd role on App Server 3.

b. Create a jinja2 template index.html.j2 under /home/thor/ansible/role/httpd/templates/ directory and add a line This file was created using Ansible on <respective server> (for example This file was created using Ansible on stapp01 in case of App Server 1). Also please make sure not to hard code the server name inside the template. Instead, use inventory_hostname variable to fetch the correct value.

c. Add a task inside /home/thor/ansible/role/httpd/tasks/main.yml to copy this template on App Server 3 under /var/www/html/index.html. Also make sure that /var/www/html/index.html file's permissions are 0644.

d. The user/group owner of /var/www/html/index.html file must be respective sudo user of the server (for example tony in case of stapp01).

Note: Validation will try to run the playbook using command ansible-playbook -i inventory playbook.yml so please make sure the playbook works this way without passing any extra arguments.

<img width="802" height="1077" alt="image" src="https://github.com/user-attachments/assets/b67ede5e-1fa4-4ec0-8eb0-f4fff41cf87e" />

---

<img width="1590" height="1207" alt="image" src="https://github.com/user-attachments/assets/3a3eae7e-7ca2-484f-a680-76c31af0ef52" />
<img width="1815" height="1145" alt="image" src="https://github.com/user-attachments/assets/6dcb5b55-d7f3-4efb-b224-f128839af80e" />
<img width="2407" height="1192" alt="image" src="https://github.com/user-attachments/assets/8189c481-9e5b-4cbb-8ce1-d1545f8f07f3" />
<img width="2441" height="1192" alt="image" src="https://github.com/user-attachments/assets/92176c56-9234-478f-bdbf-6f72828c8d13" />

<img width="2397" height="1197" alt="image" src="https://github.com/user-attachments/assets/8bbe0c4c-a5c1-4ad3-a89f-6dfc93b250f9" />

---

```sh
thor@jump-host ~$ ls
ansible
thor@jump-host ~$ ls -la ansible/
total 28
drwxr-xr-x 3 thor thor 4096 Jul 13 09:56 .
drwx------ 1 thor thor 4096 Jul 13 09:56 ..
-rw-r--r-- 1 thor thor   36 Jul 13 09:56 ansible.cfg
-rw-r--r-- 1 thor thor  219 Jul 13 09:56 inventory
-rw-r--r-- 1 thor thor   73 Jul 13 09:56 playbook.yml
drwxr-xr-x 3 thor thor 4096 Jul 13 09:56 role
thor@jump-host ~$ cd ansible/
thor@jump-host ~/ansible$ cd ..
thor@jump-host ~$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/thor/.ssh/id_rsa): 
Created directory '/home/thor/.ssh'.
Enter passphrase for "/home/thor/.ssh/id_rsa" (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/thor/.ssh/id_rsa
Your public key has been saved in /home/thor/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:B0J2XtjXDpMsjWkj1J7W/SQDQRPzDir7aLVjXvFdtDk thor@jump-host
The key's randomart image is:
+---[RSA 4096]----+
|      o.o+.**=   |
|     o oo.O O+.  |
|      . o+ *.*. .|
|       . .+..o=.+|
|        S.o . .E.|
|         +.  o .+|
|        .. .. . .|
|        .o+.     |
|       ..oo.     |
+----[SHA256]-----+
thor@jump-host ~$ 
thor@jump-host ~$ ssh-copy-ip taony@stapp01
bash: ssh-copy-ip: command not found
thor@jump-host ~$ ssh-copy-ip tony@stapp01
bash: ssh-copy-ip: command not found
thor@jump-host ~$ ssh-copy-id tony@stapp01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
The authenticity of host 'stapp01 (10.244.49.25)' can't be established.
ED25519 key fingerprint is SHA256:s8BsyjVs/gzKgcMIjWCy1cWRVlbUx8Xmv5xFvl228ig.
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
The authenticity of host 'stapp02 (10.244.97.131)' can't be established.
ED25519 key fingerprint is SHA256:ufEN5RQY7ldTbfFrlx2+gJABped8Eu2CFoDbjzoU6qo.
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
The authenticity of host 'stapp03 (10.244.234.239)' can't be established.
ED25519 key fingerprint is SHA256:bda4DsDMDr3jx9X2Zf65dadkgT/2fUhLUDQuVBYbaoU.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
banner@stapp03's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'banner@stapp03'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~$ ls -la .ssh
total 28
drwx------ 2 thor thor 4096 Jul 13 10:06 .
drwx------ 1 thor thor 4096 Jul 13 10:04 ..
-rw------- 1 thor thor 3381 Jul 13 10:04 id_rsa
-rw-r--r-- 1 thor thor  740 Jul 13 10:04 id_rsa.pub
-rw------- 1 thor thor 2457 Jul 13 10:06 known_hosts
-rw------- 1 thor thor 1727 Jul 13 10:06 known_hosts.old
thor@jump-host ~$ cat ansible/inventory 
stapp01 ansible_host=stapp01 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=stapp02 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=stapp03 ansible_ssh_pass=BigGr33n ansible_user=bannerthor@jump-host ~$ 
thor@jump-host ~$ 
thor@jump-host ~$ cat ansible/playbook.yml 
---
- hosts: 
  become: yes
  become_user: root
  roles:
    - role/httpdthor@jump-host ~$ 
thor@jump-host ~$ 
thor@jump-host ~$ vi ansible/playbook.yml 
thor@jump-host ~$ ls -la ansible/
total 28
drwxr-xr-x 3 thor thor 4096 Jul 13 10:09 .
drwx------ 1 thor thor 4096 Jul 13 10:09 ..
-rw-r--r-- 1 thor thor   36 Jul 13 09:56 ansible.cfg
-rw-r--r-- 1 thor thor  219 Jul 13 09:56 inventory
-rw-r--r-- 1 thor thor   73 Jul 13 09:56 playbook.yml
drwxr-xr-x 3 thor thor 4096 Jul 13 09:56 role
thor@jump-host ~$ cat ansible/role/
cat: ansible/role/: Is a directory
thor@jump-host ~$ cat ansible/role
cat: ansible/role: Is a directory
thor@jump-host ~$ cat ansible/role/httpd/
README.md  defaults/  files/     handlers/  meta/      tasks/     templates/ tests/     vars/      
thor@jump-host ~$ cat ansible/role/httpd/
README.md  defaults/  files/     handlers/  meta/      tasks/     templates/ tests/     vars/      
thor@jump-host ~$ cat ansible/role/httpd/tasks/main.yml 
---
# tasks file for role/test

- name: install the latest version of HTTPD
  yum:
    name: httpd
    state: latest

- name: Start service httpd
  service:
    name: httpd
    state: startedthor@jump-host ~$ 
thor@jump-host ~$ 
thor@jump-host ~$ 
thor@jump-host ~$ ls ansible/role/
httpd
thor@jump-host ~$ ls -la ansible/role/
total 12
drwxr-xr-x  3 thor thor 4096 Jul 13 09:56 .
drwxr-xr-x  3 thor thor 4096 Jul 13 10:09 ..
drwxr-xr-x 10 thor thor 4096 Jul 13 09:56 httpd
thor@jump-host ~$ ls -tree ansible/role/
ls: invalid option -- 'e'
Try 'ls --help' for more information.
thor@jump-host ~$ tree ansible/
bash: tree: command not found
thor@jump-host ~$ tree /home/thor/ansible/
bash: tree: command not found
thor@jump-host ~$ ls -R /home/thor/ansible/
/home/thor/ansible/:
ansible.cfg  inventory  playbook.yml  role

/home/thor/ansible/role:
httpd

/home/thor/ansible/role/httpd:
README.md  defaults  files  handlers  meta  tasks  templates  tests  vars

/home/thor/ansible/role/httpd/defaults:
main.yml

/home/thor/ansible/role/httpd/files:

/home/thor/ansible/role/httpd/handlers:
main.yml

/home/thor/ansible/role/httpd/meta:
main.yml

/home/thor/ansible/role/httpd/tasks:
main.yml

/home/thor/ansible/role/httpd/templates:

/home/thor/ansible/role/httpd/tests:
inventory  test.yml

/home/thor/ansible/role/httpd/vars:
main.yml
thor@jump-host ~$ cd ansible/
thor@jump-host ~/ansible$ tree
bash: tree: command not found
thor@jump-host ~/ansible$ cat /home/thor/ansible/role/httpd/tasks/main.yml
---
# tasks file for role/test

- name: install the latest version of HTTPD
  yum:
    name: httpd
    state: latest

- name: Start service httpd
  service:
    name: httpd
    state: startedthor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ ls
ansible.cfg  inventory  playbook.yml  role
thor@jump-host ~/ansible$ cd role/
thor@jump-host ~/ansible/role$ ls -la
total 12
drwxr-xr-x  3 thor thor 4096 Jul 13 09:56 .
drwxr-xr-x  3 thor thor 4096 Jul 13 10:09 ..
drwxr-xr-x 10 thor thor 4096 Jul 13 09:56 httpd
thor@jump-host ~/ansible/role$ cd httpd/
thor@jump-host ~/ansible/role/httpd$ ls -la
total 44
drwxr-xr-x 10 thor thor 4096 Jul 13 09:56 .
drwxr-xr-x  3 thor thor 4096 Jul 13 09:56 ..
-rw-r--r--  1 thor thor 1328 Jul 13 09:56 README.md
drwxr-xr-x  2 thor thor 4096 Jul 13 09:56 defaults
drwxr-xr-x  2 thor thor 4096 Jul 13 09:56 files
drwxr-xr-x  2 thor thor 4096 Jul 13 09:56 handlers
drwxr-xr-x  2 thor thor 4096 Jul 13 09:56 meta
drwxr-xr-x  2 thor thor 4096 Jul 13 09:56 tasks
drwxr-xr-x  2 thor thor 4096 Jul 13 09:56 templates
drwxr-xr-x  2 thor thor 4096 Jul 13 09:56 tests
drwxr-xr-x  2 thor thor 4096 Jul 13 09:56 vars
thor@jump-host ~/ansible/role/httpd$ cd .. 
thor@jump-host ~/ansible/role$ cd ..
thor@jump-host ~/ansible$ vi ~/ansible/playbook.yml 
thor@jump-host ~/ansible$ ls /home/thor/ansible/role/httpd/templates/
thor@jump-host ~/ansible$ ls -la /home/thor/ansible/role/httpd/templates/
total 8
drwxr-xr-x  2 thor thor 4096 Jul 13 09:56 .
drwxr-xr-x 10 thor thor 4096 Jul 13 09:56 ..
thor@jump-host ~/ansible$ vi /home/thor/ansible/role/httpd/templates/index.html.j2
thor@jump-host ~/ansible$ cat /home/thor/ansible/role/httpd/templates/index.html.j2
# Content of the jinja file:-
<p>This file was created using Ansible on {{ inventory_hostname }}</p>

# This file will pick up, whichever host the playbook is running on.
thor@jump-host ~/ansible$ cat /home/thor/ansible/role/httpd/tasks/main.yml
---
# tasks file for role/test

- name: install the latest version of HTTPD
  yum:
    name: httpd
    state: latest

- name: Start service httpd
  service:
    name: httpd
    state: startedthor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ ls /home/thor/ansible/role/httpd/tasks/
main.yml
thor@jump-host ~/ansible$ vi /home/thor/ansible/role/httpd/tasks/main.yml
thor@jump-host ~/ansible$ cat /home/thor/ansible/role/httpd/tasks/main.yml
---
# tasks file for role/test

- name: install the latest version of HTTPD
  yum:
    name: httpd
    state: latest

- name: Start service httpd
  service:
    name: httpd
    state: started

# Added this to pick up the jinja file and modify the ownership and permission.
- name: Deploy index.html template
  template:
    # Take a Jinja2 template file, render its variables, and copy the final generated file to the remote server (App Server 02, in this case).
    src: index.html.j2
    dest: /var/www/html/index.html
    owner: "{{ ansible_user }}"
    group: "{{ ansible_user }}"
    mode: '0644'
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ ssh banner@stapp03
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ ls -la /var/www/html/index.html
ls: cannot access '/var/www/html/index.html': No such file or directory
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ exit
logout
Connection to stapp03 closed.
thor@jump-host ~/ansible$ ls -la /var/www/html/index.html
ls: cannot access '/var/www/html/index.html': No such file or directory
thor@jump-host ~/ansible$ cd ..
thor@jump-host ~$ ls -la /var/www/html/index.html
ls: cannot access '/var/www/html/index.html': No such file or directory
thor@jump-host ~$ ssh banner@stapp03
Last login: Mon Jul 13 10:25:22 2026 from 10.244.97.141
[banner@stapp03 ~]$ exit
logout
Connection to stapp03 closed.
thor@jump-host ~$ ssh banner@stapp03
Last login: Mon Jul 13 10:27:40 2026 from 10.244.97.141
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ sudo systemctl status httpd
Unit httpd.service could not be found.
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ exit
logout
Connection to stapp03 closed.
thor@jump-host ~$ 
thor@jump-host ~$ cd ansible/
thor@jump-host ~/ansible$ ansible-playbook -i inventory playbook.yml

PLAY [stapp03] *************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************
ok: [stapp03]

TASK [role/httpd : install the latest version of HTTPD] ********************************************************************
changed: [stapp03]

TASK [role/httpd : Start service httpd] ************************************************************************************
changed: [stapp03]

TASK [role/httpd : Deploy index.html template] *****************************************************************************
changed: [stapp03]

PLAY RECAP *****************************************************************************************************************
stapp03                    : ok=4    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ ssh banner@stapp03
Last login: Mon Jul 13 10:29:25 2026 from 10.244.97.141
[banner@stapp03 ~]$ sudo systemctl status httpd
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; preset: disabled)
     Active: active (running) since Mon 2026-07-13 10:29:24 UTC; 22s ago
       Docs: man:httpd.service(8)
   Main PID: 25000 (httpd)
     Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes served/sec:   0 B/sec"
      Tasks: 177 (limit: 404712)
     Memory: 14.9M
        CPU: 74ms
     CGroup: /system.slice/httpd.service
             ├─25000 /usr/sbin/httpd -DFOREGROUND
             ├─25173 /usr/sbin/httpd -DFOREGROUND
             ├─25178 /usr/sbin/httpd -DFOREGROUND
             ├─25182 /usr/sbin/httpd -DFOREGROUND
             └─25184 /usr/sbin/httpd -DFOREGROUND

Jul 13 10:29:24 stapp03 systemd[1]: Starting The Apache HTTP Server...
Jul 13 10:29:24 stapp03 httpd[25000]: AH00558: httpd: Could not reliably determine the server's fully qualified domain name>
Jul 13 10:29:24 stapp03 httpd[25000]: Server configured, listening on: port 80
Jul 13 10:29:24 stapp03 systemd[1]: Started The Apache HTTP Server.
[banner@stapp03 ~]$
```


<img width="2412" height="1177" alt="image" src="https://github.com/user-attachments/assets/9ae357d8-d140-4c66-873d-c8eaf230d709" />

<img width="2380" height="1192" alt="image" src="https://github.com/user-attachments/assets/01deeca7-d975-4734-99f9-e4693863394f" />




