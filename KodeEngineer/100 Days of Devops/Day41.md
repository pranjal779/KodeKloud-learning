# Day 41: Write a Docker File

<img width="787" height="407" alt="image" src="https://github.com/user-attachments/assets/a7f53d61-27bc-4e25-8316-e650a501f9b2" />

As per recent requirements shared by the Nautilus application development team, 
they need custom images created for one of their projects. Several of the initial testing requirements are already been shared with DevOps team. 
Therefore, create a docker file /opt/docker/Dockerfile (please keep D capital of Dockerfile) on App server 3 in Stratos DC and configure to build an image with the following requirements:

a. Use ubuntu:24.04 as the base image.

b. Install apache2 and configure it to work on 8089 port. (do not update any other Apache configuration settings like document root etc).

```sh
thor@jump-host ~$ ssh banner@stapp03
The authenticity of host 'stapp03 (10.244.81.22)' can't be established.
ED25519 key fingerprint is SHA256:rLDHGzhyKPSkyHsvFxXljbxoEY9pxEH/6LG1oy7Ds8o.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp03' (ED25519) to the list of known hosts.
banner@stapp03's password: 
[banner@stapp03 ~]$ ls /opt/docker/
[banner@stapp03 ~]$ cd /opt/docker/
[banner@stapp03 docker]$ ls -la
total 12
drwxr-xr-x 2 root root 4096 May 17 11:22 .
drwxr-xr-x 1 root root 4096 May 17 11:22 ..
[banner@stapp03 docker]$ ls -ll
total 0
[banner@stapp03 docker]$

[banner@stapp03 docker]$ vi /opt/docker/Dockerfile
[banner@stapp03 docker]$ sudo vi /opt/docker/Dockerfile

# a. Use ubuntu:24.04 as the base image
FROM ubuntu:24.04

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# b. Install apache2
RUN apt-get update && apt-get install -y apache2 && apt-get clean

# b. Configure apache2 to work on port 8089
# We use sed to replace the default port 80 with 8089 in ports.conf and the default site config
RUN sed -i 's/Listen 80/Listen 8089/' /etc/apache2/ports.conf && \
    sed -i 's/:80/:8089/' /etc/apache2/sites-available/000-default.conf

# Inform Docker that the container listens on port 8089
EXPOSE 8089

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

[banner@stapp03 docker]$ docker build -t nautilus-app-image .
[+] Building 28.2s (7/7) FINISHED                                   docker:default
 => [internal] load build definition from Dockerfile                          0.1s
 => => transferring dockerfile: 694B                                          0.0s
 => [internal] load metadata for docker.io/library/ubuntu:24.04               0.0s
 => [internal] load .dockerignore                                             0.1s
 => => transferring context: 2B                                               0.0s
 => [1/3] FROM docker.io/library/ubuntu:24.04                                 0.0s
 => [2/3] RUN apt-get update && apt-get install -y apache2 && apt-get clean  26.0s
 => [3/3] RUN sed -i 's/Listen 80/Listen 8089/' /etc/apache2/ports.conf &&    0.4s 
 => exporting to image                                                        1.2s 
 => => exporting layers                                                       1.1s 
 => => writing image sha256:d28cf743d372badbca05d8e1acc597a4866b1823e24f274c  0.0s 
 => => naming to docker.io/library/nautilus-app-image                         0.0s 
[banner@stapp03 docker]$

[banner@stapp03 docker]$ history
    1  ls /opt/docker/
    2  cd /opt/docker/
    3  ls -la
    4  ls -ll
    5  vi /opt/docker/Dockerfile
    6  sudo vi /opt/docker/Dockerfile
    7  sudo cat /opt/docker/Dockerfile
    8  docker build -t nautilus-app-image .
    9  docker ps
   10  history
[banner@stapp03 docker]$ 

```

<img width="2122" height="1097" alt="image" src="https://github.com/user-attachments/assets/cdf0b2fe-7de7-4ee9-9f71-dde35e1dd9cd" />
<img width="807" height="472" alt="image" src="https://github.com/user-attachments/assets/a64a1c75-4f4b-4cc3-a382-0fce0ab56ed1" />

