# Day 73: Jenkins Scheduled Jobs

The devops team of xFusionCorp Industries is working on to setup centralised logging management system to maintain and analyse server logs easily. Since it will take some time to implement, they wanted to gather some server logs on a regular basis. At least one of the app servers is having issues with the Apache server. The team needs Apache logs so that they can identify and troubleshoot the issues easily if they arise. So they decided to create a Jenkins job to collect logs from the server. Please create/configure a Jenkins job as per details mentioned below:  

Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321  

1. Create a Jenkins jobs named copy-logs.
2. Configure it to periodically build every 3 minutes to copy the Apache logs (both access_log and error_log) from App Server 1 (stapp01) from the default logs location to location /usr/src/data on the Storage Server.
3. Build the job at least once so that the logs are copied and can be verified.

Note:
1. You might need to install some plugins and restart Jenkins. We recommend selecting Restart Jenkins when installation is complete and no jobs are running in the update centre. Refresh the page if the UI gets stuck after a restart.
2. Define the cron expression as required (e.g. */10 * * * * to run every 10 minutes).
3. For scenarios that require web UI changes, take screenshots or record your work (e.g. using loom.com) so you can share it for review if the task is marked incomplete.


<img width="807" height="1117" alt="image" src="https://github.com/user-attachments/assets/93032f87-0aa6-454e-b68e-65bd81590679" />
<img width="2437" height="1202" alt="image" src="https://github.com/user-attachments/assets/faf2a51d-30d5-448c-920c-2bf5c59cd500" />
<img width="2366" height="1192" alt="image" src="https://github.com/user-attachments/assets/6497e84b-c9a6-4767-853a-63d5cedf8bce" />
<img width="2402" height="1195" alt="image" src="https://github.com/user-attachments/assets/ea889838-f347-4467-90fb-13643d4bec85" />
<img width="892" height="246" alt="image" src="https://github.com/user-attachments/assets/60ca6872-f698-4040-bf9d-a1dd16beedc0" />
<img width="871" height="91" alt="image" src="https://github.com/user-attachments/assets/97158e54-68f5-46e3-b243-e1c5f9d21c17" />
<img width="555" height="155" alt="image" src="https://github.com/user-attachments/assets/0e199acc-2f50-4063-bf2e-5643605e6db1" />
<img width="2460" height="1237" alt="image" src="https://github.com/user-attachments/assets/00b09f73-2f8a-41a2-922f-34429721cb48" />
<img width="2432" height="1217" alt="image" src="https://github.com/user-attachments/assets/4d055a1c-94aa-49ce-a56d-c777cbf4a5e7" />
<img width="2437" height="1182" alt="image" src="https://github.com/user-attachments/assets/cf76c06e-aa81-40dc-ba3a-678e6b08b6f7" />
<img width="2380" height="1175" alt="image" src="https://github.com/user-attachments/assets/4c84c062-ca69-42b4-9ccc-62609b6a7f5b" />
<img width="2412" height="1212" alt="image" src="https://github.com/user-attachments/assets/2a83d925-c796-4d5f-8703-08c7e5fbc426" />
<img width="2395" height="1206" alt="image" src="https://github.com/user-attachments/assets/7d3e7d44-f453-4e99-9ba5-ff84dfa057db" />

```sh
ssh tony@stapp01 "scp /var/log/httpd/access_log /var/log/httpd/error_log jenkins@jenkins:/usr/src/data/"
```

<img width="2421" height="1171" alt="image" src="https://github.com/user-attachments/assets/969c6275-cb42-4470-b036-c6692b19a6fc" />
<img width="955" height="792" alt="image" src="https://github.com/user-attachments/assets/05888bff-1801-4f75-bb84-0e7c8fdf5768" />
<img width="1201" height="477" alt="image" src="https://github.com/user-attachments/assets/2a5b2a3f-5919-4920-b58c-209ca3947c0e" />

<img width="1175" height="1222" alt="image" src="https://github.com/user-attachments/assets/873a0c5c-49c0-4e13-9fc5-a79802758592" />

```sh
Started by user admin

Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/copy-logs
[copy-logs] $ /bin/sh -xe /tmp/jenkins17849814236249292944.sh
+ ssh tony@stapp01 scp /var/log/httpd/access_log /var/log/httpd/error_log jenkins@jenkins:/usr/src/data/
Host key verification failed.
Build step 'Execute shell' marked build as failure
Finished: FAILURE

```

<img width="906" height="117" alt="image" src="https://github.com/user-attachments/assets/da7d8080-2bea-4a86-a92a-edde7e201112" />



```sh
thor@jumphost ~$ ssh tony@stapp01The authenticity of host 'stapp01 (10.244.29.230)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
[tony@stapp01 ~]$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/home/tony/.ssh/id_rsa): 
Created directory '/home/tony/.ssh'.
Enter passphrase for "/home/tony/.ssh/id_rsa" (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/tony/.ssh/id_rsa
Your public key has been saved in /home/tony/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:iXBGQQ4int6/Cqhc7TkFaVxaI0KGkm5gGw/W20lap5E tony@stapp01
The key's randomart image is:
+---[RSA 4096]----+
|..=o..=.         |
|=Bo+ E =         |
|*o= X # .        |
|.+.+ & . .       |
|.. .. o S        |
|.   o  .         |
|.. . o.          |
|o o ..o          |
|.. ..+.          |
+----[SHA256]-----+
[tony@stapp01 ~]$ ssh-copy-id natasha@ststor01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/tony/.ssh/id_rsa.pub"
The authenticity of host 'ststor01 (10.244.153.163)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? 
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
The authenticity of host 'ststor01 (10.244.153.163)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? 

/usr/bin/ssh-copy-id: ERROR: Host key verification failed.

[tony@stapp01 ~]$ ssh-copy-id natasha@ststor01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/tony/.ssh/id_rsa.pub"
The authenticity of host 'ststor01 (10.244.153.163)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
natasha@ststor01's password: 

Number of key(s) added: 1

Now try logging into the machine, with: "ssh 'natasha@ststor01'"
and check to make sure that only the key(s) you wanted were added.

[tony@stapp01 ~]$ ssh 'natasha@ststor01'
[natasha@ststor01 ~]$ exit
logout
Connection to ststor01 closed.
[tony@stapp01 ~]$ cat /var/log/httpd/access_log
127.0.0.1 - - [-] "GET / HTTP/1.1" 200 -
[tony@stapp01 ~]$ cat /var/log/httpd/error_log
[notice] Apache/2.4 started
[Sat Jun 13 13:14:30.406405 2026] [suexec:notice] [pid 1274:tid 1274] AH01232: suEXEC mechanism enabled (wrapper: /usr/sbin/suexec)
AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using 10.244.29.230. Set the 'ServerName' directive globally to suppress this message
[Sat Jun 13 13:14:30.414921 2026] [lbmethod_heartbeat:notice] [pid 1274:tid 1274] AH02282: No slotmem from mod_heartmonitor
[Sat Jun 13 13:14:30.419102 2026] [mpm_event:notice] [pid 1274:tid 1274] AH00489: Apache/2.4.62 (CentOS Stream) configured -- resuming normal operations
[Sat Jun 13 13:14:30.419126 2026] [core:notice] [pid 1274:tid 1274] AH00094: Command line: '/usr/sbin/httpd -D FOREGROUND'
[tony@stapp01 ~]$ ssh jenkins@jenkins
The authenticity of host 'jenkins (10.244.73.175)' can't be established.
ED25519 key fingerprint is SHA256:tyX2fFBjS0A5pNlRaih+266sGG9JD0LpsFdIAX9iMzA.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'jenkins' (ED25519) to the list of known hosts.
jenkins@jenkins's password: 
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.8.0-90-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

jenkins@jenkins:~$ ssh-keygen -t rsa -b 4096
Generating public/private rsa key pair.
Enter file in which to save the key (/var/lib/jenkins/.ssh/id_rsa): 
Created directory '/var/lib/jenkins/.ssh'.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /var/lib/jenkins/.ssh/id_rsa
Your public key has been saved in /var/lib/jenkins/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:qzXcelQCPi4jjXDX6LmXH72ZdggjnC6N74a9VZzH0YQ jenkins@jenkins.stratos.xfusioncorp.com
The key's randomart image is:
+---[RSA 4096]----+
|               ..|
|        .     Eo |
|       + .    . .|
|  . . o + ...o . |
|   o = +So o+ o  |
|    o *.=o+o .   |
|     . X=++o..   |
|      =oB+..o+.  |
|      .*=+..+.   |
+----[SHA256]-----+
jenkins@jenkins:~$ ssh-copy-id tony@stapp01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/var/lib/jenkins/.ssh/id_rsa.pub"
The authenticity of host 'stapp01 (10.244.29.230)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
tony@stapp01's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'tony@stapp01'"
and check to make sure that only the key(s) you wanted were added.

jenkins@jenkins:~$ ssh 'tony@stapp01'
Last login: Sat Jun 13 14:44:20 2026 from 10.244.73.135
[tony@stapp01 ~]$
```

<img width="1200" height="462" alt="image" src="https://github.com/user-attachments/assets/190a9e63-4154-4159-b824-bf35d0584d98" />

<img width="1207" height="1032" alt="image" src="https://github.com/user-attachments/assets/1ae170f1-7b9b-4b98-95c4-dbf8b16aacb8" />

<img width="1202" height="487" alt="image" src="https://github.com/user-attachments/assets/877648f4-e098-4532-b9cc-0cf7673e98e0" />

```sh
Started by user admin

Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/copy-logs
[copy-logs] $ /bin/sh -xe /tmp/jenkins14432397612544209336.sh
+ scp tony@stapp01:/var/log/httpd/access_log tony@stapp01:/var/log/httpd/error_log /usr/src/data/
/usr/src/data/: No such file or directory
Build step 'Execute shell' marked build as failure
Finished: FAILURE

```

- can try this as well;
```sh
# Copy both files in one command
scp tony@stapp01:/var/log/httpd/{access_log,error_log} /usr/src/data/
```

```sh
[tony@stapp01 ~]$ ssh jenkins@jenkins
jenkins@jenkins's password: 
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.8.0-90-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.
jenkins@jenkins:~$ sudo mkdir -p /usr/src/data/
[sudo] password for jenkins: 
jenkins is not in the sudoers file.
jenkins@jenkins:~$ sudo chown -R jenkins:jenkins /usr/src/data/
[sudo] password for jenkins: 
jenkins is not in the sudoers file.
jenkins@jenkins:~$
```

```sh
# build 8
Started by timer
Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/copy-logs
[copy-logs] $ /bin/sh -xe /tmp/jenkins5909644711319741323.sh
+ scp tony@stapp01:/var/log/httpd/access_log tony@stapp01:/var/log/httpd/error_log /usr/src/data/
/usr/src/data/: No such file or directory
Build step 'Execute shell' marked build as failure
Finished: FAILURE
```

<img width="927" height="1082" alt="image" src="https://github.com/user-attachments/assets/fa2f8f9d-050d-444e-904d-dfd99ba9d8e2" />

```sh
# 1. Ensure the directory exists before copying
sudo mkdir -p /usr/src/data/

# 2. Set permissions so the jenkins user can write there
sudo chown -R jenkins:jenkins /usr/src/data/

# 3. Perform the copy
scp tony@stapp01:/var/log/httpd/{access_log,error_log} /usr/src/data/
```



