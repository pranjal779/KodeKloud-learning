# Day 44: Write a Docker Compose File

<img width="597" height="360" alt="image" src="https://github.com/user-attachments/assets/5c083ff9-ea62-452a-a26a-72421c403e8e" />
<img width="785" height="600" alt="image" src="https://github.com/user-attachments/assets/fe38e79c-96f2-457d-8961-df0f1ae02a80" />

The Nautilus application development team shared static website content that needs to be hosted on the httpd web server using a containerised platform. 
The team has shared details with the DevOps team, and we need to set up an environment according to those guidelines. Below are the details:

a. On App Server 3 in Stratos DC create a container named httpd using a docker compose file /opt/docker/docker-compose.yml (please use the exact name for file).

b. Use httpd (preferably latest tag) image for container and make sure container is named as httpd; you can use any name for service.

c. Map 80 number port of container with port 8088 of docker host.

d. Map container's /usr/local/apache2/htdocs volume with /opt/devops volume of docker host which is already there. (please do not modify any data within these locations).

```sh
[banner@stapp03 ~]$ sudo vi /opt/docker/docker-compose.yml
[banner@stapp03 ~]$ cat vi /opt/docker/docker-compose.yml
cat: vi: No such file or directory
version: '3.8'
services:
  nautilus-web:
    image: httpd:latest
    container_name: httpd
    ports:
      - "8088:80"
    volumes:
      - /opt/devops:/usr/local/apache2/htdocs

[banner@stapp03 ~]$ docker compose up
no configuration file provided: not found
[banner@stapp03 ~]$ sudo docker compose up -d /opt/docker/docker-compose.yml
no configuration file provided: not found
[banner@stapp03 ~]$ cd /opt/docker/
[banner@stapp03 docker]$ docker compose up -dWARN[0000] /opt/docker/docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
[+] up 9/9
 ✔ Image httpd:latest     Pulled                                          4.5s
 ✔ Network docker_default Created                                         0.1s
 ✔ Container httpd        Started                                         0.5s
[banner@stapp03 docker]$

[banner@stapp03 ~]$ sudo vi /opt/docker/docker-compose.yml
[banner@stapp03 ~]$ cat vi /opt/docker/docker-compose.yml
cat: vi: No such file or directory
version: '3.8'
services:
  nautilus-web:
    image: httpd:latest
    container_name: httpd
    ports:
      - "8088:80"
    volumes:
      - /opt/devops:/usr/local/apache2/htdocs

[banner@stapp03 ~]$ docker compose up
no configuration file provided: not found
[banner@stapp03 ~]$ sudo docker compose up -d /opt/docker/docker-compose.yml
no configuration file provided: not found
[banner@stapp03 ~]$ cd /opt/docker/
[banner@stapp03 docker]$ docker compose up -dWARN[0000] /opt/docker/docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
[+] up 9/9
 ✔ Image httpd:latest     Pulled                                          4.5s
 ✔ Network docker_default Created                                         0.1s
 ✔ Container httpd        Started                                         0.5s
[banner@stapp03 docker]$

[banner@stapp03 docker]$ docker compose ps
WARN[0000] /opt/docker/docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
NAME      IMAGE          COMMAND              SERVICE        CREATED          STATUS          PORTS
httpd     httpd:latest   "httpd-foreground"   nautilus-web   35 seconds ago   Up 34 seconds   0.0.0.0:8088->80/tcp, [::]:8088->80/tcp
[banner@stapp03 docker]$
[banner@stapp03 docker]$ history
    1  vi /opt/docker/docker-compose.yml
    2  sudo vi /opt/docker/docker-compose.yml
    3  cat /opt/docker/docker-compose.yml
    4  docker-compose up -d
    5  sudo vi /opt/docker/docker-compose.yml
    6  docker-compose up -d
    7  sudo docker-compose up -d
    8  sudo yum install docker-compose-plugin
    9  sudo docker-compose up -d
   10  sudo chmod +x /usr/local/bin/docker-compose
   11  sudo docker compose up -d
   12  docker-compose up -d
   13  sudo vi /opt/docker/docker-compose.yml
   14  cat vi /opt/docker/docker-compose.yml
   15  docker compose up
   16  sudo docker compose up -d /opt/docker/docker-compose.yml
   17  cd /opt/docker/
   18  docker compose up -d
   19  docker compose ps
   20  history
[banner@stapp03 docker]$ 

```

<img width="2382" height="1172" alt="image" src="https://github.com/user-attachments/assets/6ce79eca-17c9-48ff-b1e3-2138c0be57ad" />


