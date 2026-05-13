# Day 37: Copy File to Docker Container

[100 Days of DevOps | Docker | Day 35–47](https://medium.com/@niman.ransindu/100-days-of-devops-docker-day-35-47-d0af47e71d07)

<img width="857" height="295" alt="image" src="https://github.com/user-attachments/assets/6e75c2b1-0b97-450b-b078-82135230b838" />
<img width="686" height="312" alt="image" src="https://github.com/user-attachments/assets/aaa36d3d-4510-40a1-9e80-0ed7c50a6efc" />
<img width="2102" height="510" alt="image" src="https://github.com/user-attachments/assets/93980b9c-a904-48c6-b75d-97bc812dd98c" />

```sh
thor@jump-host ~$ ssh banner@stapp03
The authenticity of host 'stapp03 (10.244.221.66)' can't be established.
ED25519 key fingerprint is SHA256:Bn07GZEOs0+VQeT/HNjUb6/hJeZdkEP83biqbeQMNsI.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp03' (ED25519) to the list of known hosts.
banner@stapp03's password: 
[banner@stapp03 ~]$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
285c8d48844d   ubuntu    "/bin/bash"   3 minutes ago   Up 3 minutes             ubuntu_latest
[banner@stapp03 ~]$ docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/opt/
Successfully copied 2.05kB to ubuntu_latest:/opt/
[banner@stapp03 ~]$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
285c8d48844d   ubuntu    "/bin/bash"   7 minutes ago   Up 7 minutes             ubuntu_latest
[banner@stapp03 ~]$ docker exec 285c8d48844d tes -f /opt/nautilus.txt.gpg && echo "File exists" || "File NOT found"
OCI runtime exec failed: exec failed: unable to start container process: exec: "tes": executable file not found in $PATH: unknown
-bash: File NOT found: command not found
[banner@stapp03 ~]$ docker exec 285c8d48844d ls -l /opt/                           total 4
-rw-r--r-- 1 root root 105 May 13 06:21 nautilus.txt.gpg
[banner@stapp03 ~]$
```

```sh
[banner@stapp03 ~]$ history
    1  docker ps
    2  docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/opt/
    3  docker ps
    4  docker exec 285c8d48844d tes -f /opt/nautilus.txt.gpg && echo "File exists" || "File NOT found"
    5  docker exec 285c8d48844d ls -l /opt/
    6  history
[banner@stapp03 ~]$
```

<img width="2420" height="847" alt="image" src="https://github.com/user-attachments/assets/456401b3-ef19-4bc8-a0f2-b5d33353f902" />

<img width="2397" height="912" alt="image" src="https://github.com/user-attachments/assets/39070c67-e2eb-4e86-866e-134e3cf3f293" />
<img width="2417" height="880" alt="image" src="https://github.com/user-attachments/assets/c915810b-db3e-448e-9614-effaae755992" />

