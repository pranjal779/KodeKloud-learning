# Day 39: Create a Docker Image From Container

<img width="827" height="255" alt="image" src="https://github.com/user-attachments/assets/51767d56-f19e-4c78-8b7d-bafce903f306" />

One of the Nautilus developer was working to test new changes on a container. 
He wants to keep a backup of his changes to the container. 
A new request has been raised for the DevOps team to create a new image from this container. Below are more details about it:

a. Create an image demo:nautilus on Application Server 1 from a container ubuntu_latest that is running on same server.


```sh
thor@jump-host ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (10.244.13.21)' can't be established.
ED25519 key fingerprint is SHA256:GCbSGOqE6MKC7PTbYdt7+Do3tMN7XPzFcksDM+tFNf8.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
[tony@stapp01 ~]$ docker -v
Docker version 26.1.3, build b72abbb
[tony@stapp01 ~]$ 

[tony@stapp01 ~]$ docker commit --help

Usage:  docker commit [OPTIONS] CONTAINER [REPOSITORY[:TAG]]

Create a new image from a container's changes

Aliases:
  docker container commit, docker commit

Options:
  -a, --author string    Author (e.g., "John Hannibal Smith <hannibal@a-team.com>")
  -c, --change list      Apply Dockerfile instruction to the created image
  -m, --message string   Commit message
  -p, --pause            Pause container during commit (default true)
[tony@stapp01 ~]$

[tony@stapp01 ~]$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
26f9801beff1   ubuntu    "/bin/bash"   5 minutes ago   Up 5 minutes             ubuntu_latest
[tony@stapp01 ~]$

[tony@stapp01 ~]$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       latest    30ba44506a6d   3 weeks ago   100MB
[tony@stapp01 ~]$ 

[tony@stapp01 ~]$ docker commit ubuntu_latest demo:nautilus
sha256:8140fbc025700d97b8a13b86815b2bd3643be5efb09bc5b02f40f14d4e498bcd
[tony@stapp01 ~]$

[tony@stapp01 ~]$ docker images
REPOSITORY   TAG        IMAGE ID       CREATED          SIZE
demo         nautilus   8140fbc02570   18 seconds ago   138MB
ubuntu       latest     30ba44506a6d   3 weeks ago      100MB
[tony@stapp01 ~]$

[tony@stapp01 ~]$ history
    1  docker -v
    2  docker commit --help
    3  docker ps
    4  docker images
    5  docker commit ubuntu_latest demo:nautilus
    6  docker images
    7  history
[tony@stapp01 ~]$ 


```


To create a new image from a running container, you use the ```docker commit``` command. 
Based on the details in the image, here is the command to run on **Application Server 1**: 

```sh
docker commit ubuntu_latest demo:nautilus
```

Explanation: 
• docker commit: The command used to create a new image from a container's changes. 
• ubuntu_latest: The name (or ID) of the existing running container. 
• demo:nautilus: The name and tag for your new backup image. 

[KodeKloud Engineer Day 39: Create a Docker Image From Container. - Jane Mils](https://medium.com/@janemils/kodekloud-engineer-day-39-create-a-docker-image-from-container-0076351a5a05)
[100 Days of DevOps: Day 39-Wycliffe A. Onyango](https://dev.to/wycliffealphus/100-days-of-devops-day-39-l5m)

<img width="2327" height="1086" alt="image" src="https://github.com/user-attachments/assets/230cbab2-4080-4c2f-866f-15aebc4de8ee" />
<img width="2202" height="1151" alt="image" src="https://github.com/user-attachments/assets/d1d35f09-3b05-4287-85aa-cb9e7d875394" />

