# Day 93: Using Ansible Conditionals

The Nautilus DevOps team had a discussion about, how they can train different team members to use Ansible for different automation tasks. There are numerous ways to perform a particular task using Ansible, but we want to utilize each aspect that Ansible offers. The team wants to utilise Ansible's conditionals to perform the following task:

An inventory file is already placed under /home/thor/ansible directory on jump host, with all the Stratos DC app servers included.

Create a playbook /home/thor/ansible/playbook.yml and make sure to use Ansible's when conditionals statements to perform the below given tasks.

Copy blog.txt file present under /usr/src/sysops directory on jump host to App Server 1 under /opt/sysops directory. Its user and group owner must be user tony and its permissions must be 0777 .

Copy story.txt file present under /usr/src/sysops directory on jump host to App Server 2 under /opt/sysops directory. Its user and group owner must be user steve and its permissions must be 0777 .

Copy media.txt file present under /usr/src/sysops directory on jump host to App Server 3 under /opt/sysops directory. Its user and group owner must be user banner and its permissions must be 0777.

NOTE: You can use ansible_nodename variable from gathered facts with when condition. Additionally, please make sure you are running the play for all hosts i.e use - hosts: all.

Note: Validation will try to run the playbook using command ansible-playbook -i inventory playbook.yml, so please make sure the playbook works this way without passing any extra arguments.


<img width="836" height="1117" alt="image" src="https://github.com/user-attachments/assets/5e2570f3-3c00-4a78-b7a0-f56a39fe0a6b" />

---


<img width="1845" height="1180" alt="image" src="https://github.com/user-attachments/assets/a5541612-65f0-4bf4-94ec-daf00fef27af" />

<img width="1930" height="1205" alt="image" src="https://github.com/user-attachments/assets/aa1e7a80-7b72-44b3-ada2-f4d9d408fc80" />
<img width="1906" height="1172" alt="image" src="https://github.com/user-attachments/assets/f111bacb-03ea-4326-a695-e29e81ebbd66" />

<img width="2417" height="1166" alt="image" src="https://github.com/user-attachments/assets/2717e014-93d6-4851-98c0-89247f58059a" />
<img width="2377" height="1212" alt="image" src="https://github.com/user-attachments/assets/24fff106-f641-4daf-a944-61990bdb2c71" />

<img width="1797" height="1162" alt="image" src="https://github.com/user-attachments/assets/cf2bb495-5e0a-47ae-a9c8-da88b6bc7997" />
<img width="1787" height="1177" alt="image" src="https://github.com/user-attachments/assets/c66b701c-f12a-4f1e-a6fa-e181f9405a8d" />
<img width="1872" height="1195" alt="image" src="https://github.com/user-attachments/assets/dae3aa30-ad64-40ca-af00-d1c7afc61dcb" />



---


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
SHA256:qlOtaVSWSsCxSQpGUrA2O21ByZvDvHC8Ml1jhRCTa5k thor@jump-host
The key's randomart image is:
+---[RSA 4096]----+
|==o*B..          |
|oo.*++ .         |
|.o=.O..  .       |
|..+E.+. +        |
| o=o*..=S        |
| oo+  +..        |
|  o  o.o         |
|    ..+          |
|    .o           |
+----[SHA256]-----+
thor@jump-host ~$ 
thor@jump-host ~$ ls -la .ssh
total 20
drwx------ 2 thor thor 4096 Jul 13 13:43 .
drwx------ 1 thor thor 4096 Jul 13 13:43 ..
-rw------- 1 thor thor 3381 Jul 13 13:43 id_rsa
-rw-r--r-- 1 thor thor  740 Jul 13 13:43 id_rsa.pub
thor@jump-host ~$ cat /home/thor/ansible/inventory 
stapp01 ansible_host=stapp01 ansible_ssh_pass=Ir0nM@n ansible_user=tony
stapp02 ansible_host=stapp02 ansible_ssh_pass=Am3ric@ ansible_user=steve
stapp03 ansible_host=stapp03 ansible_ssh_pass=BigGr33n ansible_user=bannerthor@jump-host ~$ 
thor@jump-host ~$ ls -la /home/thor/ansible/
total 20
drwxr-xr-x 2 thor thor 4096 Jul 13 13:41 .
drwx------ 1 thor thor 4096 Jul 13 13:43 ..
-rw-r--r-- 1 thor thor   36 Jul 13 13:41 ansible.cfg
-rw-r--r-- 1 thor thor  219 Jul 13 13:41 inventory
thor@jump-host ~$ cd ansible/
thor@jump-host ~/ansible$ ssh-copy-id tony@stapp01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/id_rsa.pub"
The authenticity of host 'stapp01 (10.244.13.32)' can't be established.
ED25519 key fingerprint is SHA256:rR+p1JeKjvC8HKdsIuztebQ3H3bTFaKGtLObb2EvZ8w.
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
The authenticity of host 'stapp02 (10.244.73.210)' can't be established.
ED25519 key fingerprint is SHA256:uJcvTz/UQAgwjRakTyT6Y8uo9fCoACpu73Ym3S3qjKQ.
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
The authenticity of host 'stapp03 (10.244.81.110)' can't be established.
ED25519 key fingerprint is SHA256:8M4neZqSvlCwCT5MmIDOu7iVe3o9TxykGOqIgrykyPo.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
banner@stapp03's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'banner@stapp03'"
and check to make sure that only the key(s) you wanted were added.

thor@jump-host ~/ansible$ vi playbook.yml
thor@jump-host ~/ansible$ ssh tony@stapp01
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ ls -la /opt/sysops/
total 12
drwxr-xr-x 2 root root 4096 Jul 13 13:41 .
drwxr-xr-x 1 root root 4096 Jul 13 13:41 ..
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ ssh steve@stapp02
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ ls -la /opt/sysops/
total 12
drwxr-xr-x 2 root root 4096 Jul 13 13:41 .
drwxr-xr-x 1 root root 4096 Jul 13 13:41 ..
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ exit
logout
Connection to stapp02 closed.
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ ssh banner@stapp03
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ ls -la /opt/sysops/
total 12
drwxr-xr-x 2 root root 4096 Jul 13 13:41 .
drwxr-xr-x 1 root root 4096 Jul 13 13:41 ..
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ exit
logout
Connection to stapp03 closed.
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ cat ansible.yml
cat: ansible.yml: No such file or directory
thor@jump-host ~/ansible$ cat playbook.yml 
---
- hosts: all
  become: yes
  tasks:
    - name: Copy blog.txt under /usr/src/sysops in jumphost to stapp01
      copy:
        src: /usr/src/sysops/blog.txt
        dest: /opt/sysops/blog.txt
        owner: "{{ ansible_user }}"
        group: "{{ ansible_user }}"
        mode: '0777'
      when: ansible_nodename == "stapp01"
    - name: Copy story.txt under /usr/src/sysops in jumphost to stapp02
      copy:
        src: /usr/src/sysops/story.txt
        dest: /opt/sysops/story.txt
        owner: "{{ ansible_user }}"
        group: "{{ ansible_user }}"
        mode: '0777'
      when: ansbile_nodename == "stapp02"
    - name: Copy media.txt file from jump host to stapp03
      copy:
        src: /usr/src/sysops
        dest: /opt/sysops/media.txt
        owner: "{{ ansible_user }}"
        group: "{{ ansible_user }}"
        mode: '0777'
      when: ansible_nodename == "stapp03"
thor@jump-host ~/ansible$ vi playbook.yml
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ cat /usr/src/sysops/blog.txt 
Welcome to xFusionCorp Industries !thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ cat /usr/src/sysops/story.txt 
Welcome to Nautilus Group !thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ cat /usr/src/sysops/media.txt 
Welcome to KodeKloud !thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ ansible-playbook -i inventory playbook.yml

PLAY [all] *****************************************************************************************************************

TASK [Gathering Facts] *****************************************************************************************************
ok: [stapp01]
ok: [stapp03]
ok: [stapp02]

TASK [Copy blog.txt under /usr/src/sysops in jumphost to stapp01] **********************************************************
skipping: [stapp02]
skipping: [stapp03]
changed: [stapp01]

TASK [Copy story.txt under /usr/src/sysops in jumphost to stapp02] *********************************************************
fatal: [stapp01]: FAILED! => {"msg": "The conditional check 'ansbile_nodename == \"stapp02\"' failed. The error was: error while evaluating conditional (ansbile_nodename == \"stapp02\"): 'ansbile_nodename' is undefined. 'ansbile_nodename' is undefined\n\nThe error appears to be in '/home/thor/ansible/playbook.yml': line 13, column 7, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n      when: ansible_nodename == \"stapp01\"\n    - name: Copy story.txt under /usr/src/sysops in jumphost to stapp02\n      ^ here\n"}
fatal: [stapp02]: FAILED! => {"msg": "The conditional check 'ansbile_nodename == \"stapp02\"' failed. The error was: error while evaluating conditional (ansbile_nodename == \"stapp02\"): 'ansbile_nodename' is undefined. 'ansbile_nodename' is undefined\n\nThe error appears to be in '/home/thor/ansible/playbook.yml': line 13, column 7, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n      when: ansible_nodename == \"stapp01\"\n    - name: Copy story.txt under /usr/src/sysops in jumphost to stapp02\n      ^ here\n"}
fatal: [stapp03]: FAILED! => {"msg": "The conditional check 'ansbile_nodename == \"stapp02\"' failed. The error was: error while evaluating conditional (ansbile_nodename == \"stapp02\"): 'ansbile_nodename' is undefined. 'ansbile_nodename' is undefined\n\nThe error appears to be in '/home/thor/ansible/playbook.yml': line 13, column 7, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n      when: ansible_nodename == \"stapp01\"\n    - name: Copy story.txt under /usr/src/sysops in jumphost to stapp02\n      ^ here\n"}

PLAY RECAP *****************************************************************************************************************
stapp01                    : ok=2    changed=1    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
stapp02                    : ok=1    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0   
stapp03                    : ok=1    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0   

thor@jump-host ~/ansible$ vi playbook.yml
thor@jump-host ~/ansible$ vi playbook.yml
thor@jump-host ~/ansible$ ansible-playbook -i inventory playbook.yml

PLAY [all] ********************************************************************************

TASK [Gathering Facts] ********************************************************************
ok: [stapp03]
ok: [stapp02]
ok: [stapp01]

TASK [Copy blog.txt under /usr/src/sysops in jumphost to stapp01] *************************
skipping: [stapp02]
skipping: [stapp03]
ok: [stapp01]

TASK [Copy story.txt under /usr/src/sysops in jumphost to stapp02] ************************
fatal: [stapp01]: FAILED! => {"msg": "The conditional check 'ansbile_nodename == \"stapp02\"' failed. The error was: error while evaluating conditional (ansbile_nodename == \"stapp02\"): 'ansbile_nodename' is undefined. 'ansbile_nodename' is undefined\n\nThe error appears to be in '/home/thor/ansible/playbook.yml': line 13, column 7, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n      when: ansible_nodename == \"stapp01\"\n    - name: Copy story.txt under /usr/src/sysops in jumphost to stapp02\n      ^ here\n"}
fatal: [stapp02]: FAILED! => {"msg": "The conditional check 'ansbile_nodename == \"stapp02\"' failed. The error was: error while evaluating conditional (ansbile_nodename == \"stapp02\"): 'ansbile_nodename' is undefined. 'ansbile_nodename' is undefined\n\nThe error appears to be in '/home/thor/ansible/playbook.yml': line 13, column 7, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n      when: ansible_nodename == \"stapp01\"\n    - name: Copy story.txt under /usr/src/sysops in jumphost to stapp02\n      ^ here\n"}
fatal: [stapp03]: FAILED! => {"msg": "The conditional check 'ansbile_nodename == \"stapp02\"' failed. The error was: error while evaluating conditional (ansbile_nodename == \"stapp02\"): 'ansbile_nodename' is undefined. 'ansbile_nodename' is undefined\n\nThe error appears to be in '/home/thor/ansible/playbook.yml': line 13, column 7, but may\nbe elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n      when: ansible_nodename == \"stapp01\"\n    - name: Copy story.txt under /usr/src/sysops in jumphost to stapp02\n      ^ here\n"}

PLAY RECAP ********************************************************************************
stapp01                    : ok=2    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0   
stapp02                    : ok=1    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0   
stapp03                    : ok=1    changed=0    unreachable=0    failed=1    skipped=1    rescued=0    ignored=0   

thor@jump-host ~/ansible$ vi playbook.yml
thor@jump-host ~/ansible$ cat playbook.yml
---
- hosts: all
  become: yes
  tasks:
    - name: Copy blog.txt under /usr/src/sysops in jumphost to stapp01
      copy:
        src: /usr/src/sysops/blog.txt
        dest: /opt/sysops/
        owner: "{{ ansible_user }}"
        group: "{{ ansible_user }}"
        mode: '0777'
      when: ansible_nodename == "stapp01"
    - name: Copy story.txt under /usr/src/sysops in jumphost to stapp02
      copy:
        src: /usr/src/sysops/story.txt
        dest: /opt/sysops/
        owner: "{{ ansible_user }}"
        group: "{{ ansible_user }}"
        mode: '0777'
      when: ansible_nodename == "stapp02"
    - name: Copy media.txt file from jump host to stapp03
      copy:
        src: /usr/src/sysops/media.txt
        dest: /opt/sysops/
        owner: "{{ ansible_user }}"
        group: "{{ ansible_user }}"
        mode: '0777'
      when: ansible_nodename == "stapp03"
thor@jump-host ~/ansible$ ansible-playbook -i inventory playbook.yml

PLAY [all] ********************************************************************************

TASK [Gathering Facts] ********************************************************************
ok: [stapp01]
ok: [stapp02]
ok: [stapp03]

TASK [Copy blog.txt under /usr/src/sysops in jumphost to stapp01] *************************
skipping: [stapp02]
skipping: [stapp03]
ok: [stapp01]

TASK [Copy story.txt under /usr/src/sysops in jumphost to stapp02] ************************
skipping: [stapp01]
skipping: [stapp03]
changed: [stapp02]

TASK [Copy media.txt file from jump host to stapp03] **************************************
skipping: [stapp01]
skipping: [stapp02]
changed: [stapp03]

PLAY RECAP ********************************************************************************
stapp01                    : ok=2    changed=0    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
stapp02                    : ok=2    changed=1    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
stapp03                    : ok=2    changed=1    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   

thor@jump-host ~/ansible$ ssh tony@stapp01
Last login: Mon Jul 13 14:12:47 2026 from 10.244.247.201
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ ls -la /opt/sysops/
total 16
drwxr-xr-x 2 root root 4096 Jul 13 14:05 .
drwxr-xr-x 1 root root 4096 Jul 13 13:41 ..
-rwxrwxrwx 1 tony tony   35 Jul 13 14:05 blog.txt
[tony@stapp01 ~]$ cat /opt/sysops/
cat: /opt/sysops/: Is a directory
[tony@stapp01 ~]$ cat /opt/sysops/blog.txt 
Welcome to xFusionCorp Industries ![tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ \n cat /opt/sysops/blog.txt 
-bash: n: command not found
[tony@stapp01 ~]$ /n cat /opt/sysops/blog.txt 
-bash: /n: No such file or directory
[tony@stapp01 ~]$ cat /opt/sysops/blog.txt; echo ""
Welcome to xFusionCorp Industries !
[tony@stapp01 ~]$ exit
logout
Connection to stapp01 closed.
thor@jump-host ~/ansible$ ssh steve@stapp02
Last login: Mon Jul 13 14:12:48 2026 from 10.244.247.201
[steve@stapp02 ~]$ ls -la /opt/sysops/
total 16
drwxr-xr-x 2 root  root  4096 Jul 13 14:12 .
drwxr-xr-x 1 root  root  4096 Jul 13 13:41 ..
-rwxrwxrwx 1 steve steve   27 Jul 13 14:12 story.txt
[steve@stapp02 ~]$ cat /opt/sysops/story.txt; echo ""
Welcome to Nautilus Group !
[steve@stapp02 ~]$ 
[steve@stapp02 ~]$ exit
logout
Connection to stapp02 closed.
thor@jump-host ~/ansible$ 
thor@jump-host ~/ansible$ ssh banner@stapp03
Last login: Mon Jul 13 14:12:49 2026 from 10.244.247.201
[banner@stapp03 ~]$ ls -la /opt/sysops/
total 16
drwxr-xr-x 2 root   root   4096 Jul 13 14:12 .
drwxr-xr-x 1 root   root   4096 Jul 13 13:41 ..
-rwxrwxrwx 1 banner banner   22 Jul 13 14:12 media.txt
[banner@stapp03 ~]$ cat /opt/sysops/media.txt; echo ""
Welcome to KodeKloud !
[banner@stapp03 ~]$ history
    1  ls -la /opt/sysops/
    2  exit
    3  ls -la /opt/sysops/
    4  cat /opt/sysops/media.txt; echo ""
    5  history
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$

```



<img width="2112" height="1191" alt="image" src="https://github.com/user-attachments/assets/24f0ecc9-5704-4d73-9a23-468995cef944" />

<img width="2072" height="1202" alt="image" src="https://github.com/user-attachments/assets/d13cbe41-a3b7-4e9b-8d39-bcf90610a1da" />











