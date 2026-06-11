# Day 71: Configure Jenkins Job for Package Installation

<img width="871" height="1076" alt="image" src="https://github.com/user-attachments/assets/d000daf7-0132-49b8-9b02-d824dc5817df" />

Some new requirements have come up to install and configure some packages on the Nautilus infrastructure under Stratos Datacenter.   
The Nautilus DevOps team installed and configured a new Jenkins server so they wanted to create a Jenkins job to automate this task.   
Find below more details and complete the task accordingly:

1. Access the Jenkins UI by clicking on the Jenkins button in the top bar. Log in using the credentials: username admin and password Adm!n321.
2. Create a new Jenkins job named install-packages and configure it with the following specifications:
- Add a string parameter named PACKAGE.  
- Configure the job to install a package specified in the $PACKAGE parameter on the storage server (Stratos Datacenter).  
- Build the job at least once (e.g. with parameter PACKAGE=vim-enhanced) so the package is installed on the Storage server and can be verified.  

Note:
1. Ensure to install any required plugins and restart the Jenkins service if necessary. Opt for Restart Jenkins when installation is complete and no jobs are running on the plugin installation/update page. Refresh the UI page if needed after restarting the service.
2. Verify that the Jenkins job runs successfully on repeated executions to ensure reliability.
3. Capture screenshots of your configuration for documentation and review purposes. Alternatively, use screen recording software like loom.com for comprehensive documentation and sharing.


<img width="2172" height="1202" alt="image" src="https://github.com/user-attachments/assets/47688af3-ea8b-4a81-9c6e-ef7a0b4d1a2b" />
<img width="2442" height="1197" alt="image" src="https://github.com/user-attachments/assets/e84fb002-63da-4981-8f17-79136c4a9cfb" />
<img width="2367" height="1191" alt="image" src="https://github.com/user-attachments/assets/0526c473-c897-49cb-a3ee-b5fcdb11dc71" />
<img width="2461" height="1211" alt="image" src="https://github.com/user-attachments/assets/d8797a57-9b7d-4c4e-b0e2-c4a087f8b286" />

```sh
thor@jumphost ~$ cat /etc/os-release
NAME="CentOS Stream"
VERSION="9"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="9"
PLATFORM_ID="platform:el9"
PRETTY_NAME="CentOS Stream 9"
ANSI_COLOR="0;31"
LOGO="fedora-logo-icon"
CPE_NAME="cpe:/o:centos:centos:9"
HOME_URL="https://centos.org/"
BUG_REPORT_URL="https://issues.redhat.com/"
REDHAT_SUPPORT_PRODUCT="Red Hat Enterprise Linux 9"
REDHAT_SUPPORT_PRODUCT_VERSION="CentOS Stream"
thor@jumphost ~$ ssh natasha@ststor01
The authenticity of host 'ststor01 (10.244.153.175)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ststor01' (ED25519) to the list of known hosts.
natasha@ststor01's password: 
[natasha@ststor01 ~]$ ssh jenkins@jenkins
The authenticity of host 'jenkins (10.244.247.219)' can't be established.
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
SHA256:X3f+dAJauMs2yNZZXkTgS7V3OxP2rwKZgaTJNpOm83g jenkins@jenkins.stratos.xfusioncorp.com
The key's randomart image is:
+---[RSA 4096]----+
|            ...  |
|        .  . ... |
|     . = .  o..oo|
|      X . .o .o.=|
|     + oS .+=..+o|
|    o    .+=.o.o+|
|     + . o+= .. =|
|    . E +.=.o  +o|
|     . . .o. .. .|
+----[SHA256]-----+
jenkins@jenkins:~$

jenkins@jenkins:~$ sh-copy-id natasha@ststor01-bash: sh-copy-id: command not found
jenkins@jenkins:~$ ssh-copy-id natasha@ststor01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/var/lib/jenkins/.ssh/id_rsa.pub"
The authenticity of host 'ststor01 (10.244.153.175)' can't be established.
ED25519 key fingerprint is SHA256:yEyN8qvzhNxfcKVE+H05zwQPmQMKCXj4JyGWuOP1HIg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
natasha@ststor01's password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'natasha@ststor01'"
and check to make sure that only the key(s) you wanted were added.

jenkins@jenkins:~$

Now try logging into the machine, with:   "ssh 'natasha@ststor01'"
and check to make sure that only the key(s) you wanted were added.

jenkins@jenkins:~$ ssh natasha@ststor01
Last login: Thu Jun 11 17:32:22 2026 from 10.244.73.140
[natasha@ststor01 ~]$


jenkins@jenkins:~$ ssh natasha@ststor01
Last login: Thu Jun 11 17:32:22 2026 from 10.244.73.140
[natasha@ststor01 ~]$ dnf list installed | grep vim-enhanced
[natasha@ststor01 ~]$ 


```

<img width="2411" height="1182" alt="image" src="https://github.com/user-attachments/assets/c1049d1f-c63c-4cca-906d-f07a14506021" />
<img width="1027" height="820" alt="image" src="https://github.com/user-attachments/assets/c11833ab-b555-4000-8631-bc8f3b6451c0" />
<img width="1097" height="965" alt="image" src="https://github.com/user-attachments/assets/fe74fb8f-2d98-40ac-a447-9f6499c33262" />
<img width="1242" height="680" alt="image" src="https://github.com/user-attachments/assets/6194e140-5ceb-47d8-83e1-31333117268c" />
<img width="1240" height="1220" alt="image" src="https://github.com/user-attachments/assets/a330c189-158b-4836-81be-11e1998e3a3b" />
<img width="1102" height="850" alt="image" src="https://github.com/user-attachments/assets/8c14d21c-5ac3-4025-95ca-a0e12e96f185" />
<img width="1217" height="792" alt="image" src="https://github.com/user-attachments/assets/728a6d80-3fe4-4681-9b2d-f7195c41f85b" />
<img width="1047" height="892" alt="image" src="https://github.com/user-attachments/assets/c91865e3-e92e-44cf-aaae-470b718f4ede" />
<img width="1231" height="1196" alt="image" src="https://github.com/user-attachments/assets/755579e5-e5f4-42a6-bf3e-41c37fdcc500" />

```sh
Started by user admin

Running as SYSTEM
Building in workspace /var/lib/jenkins/workspace/install-packages
[install-packages] $ /bin/sh -xe /tmp/jenkins16615516172487338472.sh
+ ssh natasha@ststor01 sudo dnf makecache && sudo dnf install -y vim-enhanced
CentOS Stream 9 - BaseOS                        120 kB/s |  14 kB     00:00    
CentOS Stream 9 - AppStream                     128 kB/s |  14 kB     00:00    
CentOS Stream 9 - Extras packages               116 kB/s |  15 kB     00:00    
Docker CE Stable - x86_64                       136 kB/s | 2.0 kB     00:00    
Extra Packages for Enterprise Linux 9 - x86_64  264 kB/s |  35 kB     00:00    
Extra Packages for Enterprise Linux 9 openh264  8.1 kB/s | 993  B     00:00    
Extra Packages for Enterprise Linux 9 - Next -  268 kB/s |  38 kB     00:00    
Metadata cache created.
Last metadata expiration check: 0:00:01 ago on Thu Jun 11 17:53:13 2026.
Dependencies resolved.
================================================================================
 Package             Arch        Version                   Repository      Size
================================================================================
Installing:
 vim-enhanced        x86_64      2:8.2.2637-31.el9         appstream      1.7 M
Installing dependencies:
 gpm-libs            x86_64      1.20.7-29.el9             appstream       21 k
 vim-common          x86_64      2:8.2.2637-31.el9         appstream      7.0 M
 vim-filesystem      noarch      2:8.2.2637-31.el9         baseos          14 k

Transaction Summary
================================================================================
Install  4 Packages

Total download size: 8.8 M
Installed size: 34 M
Downloading Packages:
(1/4): vim-filesystem-8.2.2637-31.el9.noarch.rp  96 kB/s |  14 kB     00:00    
(2/4): gpm-libs-1.20.7-29.el9.x86_64.rpm         21 kB/s |  21 kB     00:01    
(3/4): vim-enhanced-8.2.2637-31.el9.x86_64.rpm  1.7 MB/s | 1.7 MB     00:01    
(4/4): vim-common-8.2.2637-31.el9.x86_64.rpm    5.3 MB/s | 7.0 MB     00:01    
--------------------------------------------------------------------------------
Total                                           4.7 MB/s | 8.8 MB     00:01     
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                        1/1 
  Installing       : gpm-libs-1.20.7-29.el9.x86_64                          1/4 
  Installing       : vim-filesystem-2:8.2.2637-31.el9.noarch                2/4 
  Installing       : vim-common-2:8.2.2637-31.el9.x86_64                    3/4 
  Installing       : vim-enhanced-2:8.2.2637-31.el9.x86_64                  4/4 
  Running scriptlet: vim-enhanced-2:8.2.2637-31.el9.x86_64                  4/4 
  Verifying        : vim-filesystem-2:8.2.2637-31.el9.noarch                1/4 
  Verifying        : gpm-libs-1.20.7-29.el9.x86_64                          2/4 
  Verifying        : vim-common-2:8.2.2637-31.el9.x86_64                    3/4 
  Verifying        : vim-enhanced-2:8.2.2637-31.el9.x86_64                  4/4 

Installed:
  gpm-libs-1.20.7-29.el9.x86_64         vim-common-2:8.2.2637-31.el9.x86_64    
  vim-enhanced-2:8.2.2637-31.el9.x86_64 vim-filesystem-2:8.2.2637-31.el9.noarch

Complete!
Finished: SUCCESS


```

<img width="2422" height="1197" alt="image" src="https://github.com/user-attachments/assets/34cc1045-78b9-4ac5-a194-17aa35c652d8" />
<img width="2422" height="1227" alt="image" src="https://github.com/user-attachments/assets/d6540fba-675d-4f13-9068-7a157ff73176" />
