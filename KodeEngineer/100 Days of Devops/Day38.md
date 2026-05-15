# Day 38: Pull Docker Image

<img width="827" height="271" alt="image" src="https://github.com/user-attachments/assets/b37ec494-47e7-4865-81e2-799cdc22b58f" />

Nautilus project developers are planning to start testing on a new project. 
As per their meeting with the DevOps team, they want to test containerized environment application features. 
As per details shared with DevOps team, we need to accomplish the following task:

a. Pull busybox:musl image on App Server 3 in Stratos DC and re-tag (create new tag) this image as busybox:blog.

```sh
thor@jump-host ~$ ssh banner@stapp03
The authenticity of host 'stapp03 (10.244.240.159)' can't be established.
ED25519 key fingerprint is SHA256:cVxeAG8hiRQrcoI+1eVFafYGAH3EwLNQfMz2TAOMe/I.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp03' (ED25519) to the list of known hosts.
banner@stapp03's password: 
[banner@stapp03 ~]$ docker pull busybox:musl
musl: Pulling from library/busybox
5bfa213ad291: Pull complete 
Digest: sha256:19b646668802469d968a05342a601e78da4322a414a7c09b1c9ee25165042138
Status: Downloaded newer image for busybox:musl
docker.io/library/busybox:musl
[banner@stapp03 ~]$ docker tag busybox:musl busybox:blog
[banner@stapp03 ~]$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
busybox      blog      0188a8de47ca   19 months ago   1.51MB
busybox      musl      0188a8de47ca   19 months ago   1.51MB
[banner@stapp03 ~]$
```

<img width="1885" height="841" alt="image" src="https://github.com/user-attachments/assets/c0b9634f-65f3-4543-acde-142b8b73dd76" />
<img width="1981" height="882" alt="image" src="https://github.com/user-attachments/assets/1484faaa-faac-4cc7-9db4-601b099ac044" />
<img width="900" height="601" alt="image" src="https://github.com/user-attachments/assets/d82b1bbe-d620-4a64-b34d-b822f846d071" />


Verify the ResultsConfirm that both the original and the new tags exist in your local repository:  
```docker images```  

The output should show both ```busybox:musl``` and ```busybox:blog``` sharing the same IMAGE ID   
