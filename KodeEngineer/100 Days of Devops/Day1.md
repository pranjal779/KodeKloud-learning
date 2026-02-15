# Day 1: Linux User Setup with Non-Interactive Shell

<img width="1423" height="825" alt="image" src="https://github.com/user-attachments/assets/225054e0-195d-4bce-9872-590bdbe38985" />

To accommodate the backup agent tool's specifications, the system admin team at xFusionCorp Industries requires the creation of a user with a non-interactive shell. Here's your task:

Create a user named jim with a non-interactive shell on App Server 2.

Note: You can find the infrastructure details by clicking on the Details of all Users and Servers button on the top-right section of the page.


<img width="1645" height="701" alt="image" src="https://github.com/user-attachments/assets/f76b9d72-4960-44b8-90ca-6933fd5d2ddd" />

<img width="1643" height="968" alt="image" src="https://github.com/user-attachments/assets/abb6a708-a1cb-417d-b67e-f5549c7a3334" />

<img width="827" height="857" alt="image" src="https://github.com/user-attachments/assets/b64ed86e-70ec-4a96-9965-cfc11b2568b8" />

<img width="855" height="1077" alt="image" src="https://github.com/user-attachments/assets/eb5a3a0f-131d-4e35-8347-f59f7bb2ecd4" />
<img width="867" height="406" alt="image" src="https://github.com/user-attachments/assets/0f8b0dc6-a9a0-465b-8010-563653441f30" />

<img width="1941" height="833" alt="image" src="https://github.com/user-attachments/assets/8cac8407-7569-4823-9f3f-916c82cf0daa" />

```
thor@jumphost ~$ ssh steve@172.16.238.11
The authenticity of host '172.16.238.11 (172.16.238.11)' can't be established.
ED25519 key fingerprint is SHA256:VFKy4B3ihezaTK+AZj2m5qUSDMclnarlSfAZYPANtfk.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '172.16.238.11' (ED25519) to the list of known hosts.
steve@172.16.238.11's password: 
Permission denied, please try again.
steve@172.16.238.11's password: 
Last failed login: Sun Feb 15 17:22:35 UTC 2026 from 172.16.238.3 on ssh:notty
There was 1 failed login attempt since the last successful login.
[steve@stapp02 ~]$ sudo useradd -s /sbin/nologin jim

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for steve: 
[steve@stapp02 ~]$ 
```

<img width="1977" height="800" alt="image" src="https://github.com/user-attachments/assets/1db1a6b3-c5e4-486b-951b-48baaec06936" />
