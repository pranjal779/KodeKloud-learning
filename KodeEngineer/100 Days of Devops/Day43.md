# Day 43: Docker Ports Mapping

[reference](https://tundedamian.medium.com/day-43-of-100-days-of-devops-deploying-an-nginx-container-with-docker-73a012f9e20e)

The Nautilus DevOps team is planning to host an application on a nginx-based container. 
There are number of tickets already been created for similar tasks. 
One of the tickets has been assigned to set up a nginx container on Application Server 1 in Stratos Datacenter. 
Please perform the task as per details mentioned below:

a. Pull nginx:stable docker image on Application Server 1.

b. Create a container named news using the image you pulled.

c. Map host port 5001 to container port 80. Please keep the container in running state.

<img width="816" height="417" alt="image" src="https://github.com/user-attachments/assets/b357ef7e-26b7-411f-9696-014c033bd416" />

```sh
thor@jump-host ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (10.244.73.167)' can't be established.
ED25519 key fingerprint is SHA256:0Y4B4jBfaGkOqJEGKgKBQSk26NGIVeHaFC3rpbOjxsA.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
[tony@stapp01 ~]$ docker pull nginx:stable
stable: Pulling from library/nginx
57fb71246055: Pull complete 
8240314804b5: Pull complete 
ec8920bf3508: Pull complete 
50813b7d3c2d: Pull complete 
9e10fd5b43d5: Pull complete 
89b1086f6d3c: Pull complete 
8970cf8766d4: Pull complete 
Digest: sha256:842a3f99afd73859b5c647f8be6f0000849be286674e30d9dbcf7a6902a69487
Status: Downloaded newer image for nginx:stable
docker.io/library/nginx:stable
[tony@stapp01 ~]$ docker run -d --name news -p 5001:80 nginx:stable
89aff5314a4af50fba856fe1961008e0d7339d924edf180698b962a1eb4c167d
[tony@stapp01 ~]$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED              STATUS              PORTS                                   NAMES
89aff5314a4a   nginx:stable   "/docker-entrypoint.…"   About a minute ago   Up About a minute   0.0.0.0:5001->80/tcp, :::5001->80/tcp   news
[tony@stapp01 ~]$

```
<img width="2366" height="842" alt="image" src="https://github.com/user-attachments/assets/0fd683c7-1e1c-4412-83e6-2528449b6c1c" />
<img width="2397" height="720" alt="image" src="https://github.com/user-attachments/assets/fb854b22-ccd3-495d-938e-e19b8a11a2a6" />
<img width="800" height="482" alt="image" src="https://github.com/user-attachments/assets/fcdc400a-838c-41c8-9f89-0f1e9cc414a9" />


