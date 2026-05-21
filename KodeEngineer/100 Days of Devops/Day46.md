# Day 46: Deploy an App on Docker Containers


The Nautilus Application development team recently finished development of one of the apps that they want to deploy on a containerized platform.  
The Nautilus Application development and DevOps teams met to discuss some of the basic pre-requisites and requirements to complete the deployment.  
The team wants to test the deployment on one of the app servers before going live and set up a complete containerized stack using a docker compose fie.  
Below are the details of the task:  

On App Server 3 in Stratos Datacenter create a docker compose file /opt/data/docker-compose.yml (should be named exactly).   
The compose should deploy two services (web and DB), and each service should deploy a container as per details below:  

For web service:  
a. Container name must be php_apache.  
b. Use image php with any apache tag. Check [here](https://hub.docker.com/_/php?tab=tags/) for more details.  
c. Map php_apache container's port 80 with host port 5002  
d. Map php_apache container's /var/www/html volume with host volume /var/www/html.  

For DB service:  
a. Container name must be mysql_apache.  
b. Use image mariadb with any tag (preferably latest). Check [here](https://hub.docker.com/_/mariadb?tab=tags/) for more details.  
c. Map mysql_apache container's port 3306 with host port 3306   
d. Map mysql_apache container's /var/lib/mysql volume with host volume /var/lib/mysql.  
e. Set MYSQL_DATABASE=database_apache and use any custom user ( except root ) with some complex password for DB connections.  

After running docker-compose up you can access the app with curl command curl <server-ip or hostname>:5002/

For more details check [here](https://hub.docker.com/_/mariadb?tab=description/).

Note: Once you click on FINISH button, all currently running/stopped containers will be destroyed and stack will be deployed again using your compose file.


<img width="837" height="867" alt="image" src="https://github.com/user-attachments/assets/dd44c220-6c34-4be0-9d79-0568b57d459e" />
<img width="767" height="752" alt="image" src="https://github.com/user-attachments/assets/0be385f4-0e68-4ae4-8f16-34ffc8e68f4e" />


```sh
thor@jump-host ~$ ssh banner@stapp03
The authenticity of host 'stapp03 (10.244.195.44)' can't be established.
ED25519 key fingerprint is SHA256:LJhvQzXdHWjAjGQCCf7FAfej8wtZmTsh8+zZ6Bf+0gY.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp03' (ED25519) to the list of known hosts.
banner@stapp03's password: 
Permission denied, please try again.
banner@stapp03's password: 
Last failed login: Thu May 21 11:45:55 UTC 2026 from 10.244.221.57 on ssh:notty
There was 1 failed login attempt since the last successful login.
[banner@stapp03 ~]$ ls /opt/data/
[banner@stapp03 ~]$ ls ll /opt/data/
ls: cannot access 'll': No such file or directory
/opt/data/:
[banner@stapp03 ~]$ ls -ll /opt/data/
total 0
[banner@stapp03 ~]$ sudo vi /opt/data/docker-compose.yml

We trust you have received the usual lecture from the local System
Administrator. It usually boils down to these three things:

    #1) Respect the privacy of others.
    #2) Think before you type.
    #3) With great power comes great responsibility.

[sudo] password for banner: 
[banner@stapp03 ~]$ cat /opt/data/docker-compose.yml
version: '3'
services: 
  web:
    image: php:8.2-apache
    container_name: php_apache
    ports:
      - "5002:80"
    volumes:
      - /var/www/html:/var/www/html

  db:
    image: mariadb:latest
    container_name: mysql_apache
    ports:
      - "3306:3306"
    volume:
      - /var/lib/mysql:/var/lib/mysql
    environment:
      MYSQL_DATABASE: database_apache
      MYSQL_USER: my_custom_user
      MYSQL_PASSWORD: MyComplexPassword123!
      MYSQL_ROOT_PASSWORD: rootpassword # MariaDB requires a root password
[banner@stapp03 ~]$

[banner@stapp03 ~]$ sudo docker compose up -d
[sudo] password for banner: 
no configuration file provided: not found
[banner@stapp03 ~]$ sudo docker compose up -d /opt/data/docker-compose.yml
no configuration file provided: not found
[banner@stapp03 ~]$ cd /opt/data/
[banner@stapp03 data]$ sudo docker compose up -d
validating /opt/data/docker-compose.yml: services.db additional properties 'volume' not allowed
[banner@stapp03 data]$ sudo vi /opt/data/docker-compose.yml
[banner@stapp03 data]$ cat /opt/data/docker-compose.yml
version: '3'
services: 
  web:
    image: php:8.2-apache
    container_name: php_apache
    ports:
      - "5002:80"
    volumes:
      - /var/www/html:/var/www/html

  db:
    image: mariadb:latest
    container_name: mysql_apache
    ports:
      - "3306:3306"
    volumes:
      - /var/lib/mysql:/var/lib/mysql
    environment:
      MYSQL_DATABASE: database_apache
      MYSQL_USER: my_custom_user
      MYSQL_PASSWORD: MyComplexPassword123!
      MYSQL_ROOT_PASSWORD: rootpassword # MariaDB requires a root password
[banner@stapp03 data]$

[banner@stapp03 data]$ sudo docker compose up -d
WARN[0000] /opt/data/docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
[+] up 23/25
 ⠹ Image php:8.2-apache [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿] 168.1MB / 175.6MB Pulling                                                     4.3s
 ⠹ Image mariadb:latest [⣿⣿⣿⣿⣿⣿⣿⣿] 103.4MB / 106.8MB        Pulling                                                     4.3s


[banner@stapp03 data]$ sudo docker compose up -d
WARN[0000] /opt/data/docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
[+] up 28/28
 ✔ Image php:8.2-apache   Pulled                                                                                       14.1s
 ✔ Image mariadb:latest   Pulled                                                                                       11.2s
 ✔ Network data_default   Created                                                                                      0.1s
 ✔ Container mysql_apache Created                                                                                      0.2s
 ✔ Container php_apache   Created                                                                                      0.2s
[banner@stapp03 data]$


[banner@stapp03 data]$ sudo docker compose ps
WARN[0000] /opt/data/docker-compose.yml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
NAME           IMAGE            COMMAND                  SERVICE   CREATED              STATUS              PORTS
mysql_apache   mariadb:latest   "docker-entrypoint.s…"   db        About a minute ago   Up About a minute   0.0.0.0:3306->3306/tcp, [::]:3306->3306/tcp
php_apache     php:8.2-apache   "docker-php-entrypoi…"   web       About a minute ago   Up About a minute   0.0.0.0:5002->80/tcp, [::]:5002->80/tcp
[banner@stapp03 data]$

[banner@stapp03 data]$ sudo docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED         STATUS         PORTS                                       NAMES
4860e5b6f724   mariadb:latest   "docker-entrypoint.s…"   2 minutes ago   Up 2 minutes   0.0.0.0:3306->3306/tcp, :::3306->3306/tcp   mysql_apache
5fbe3e1de597   php:8.2-apache   "docker-php-entrypoi…"   2 minutes ago   Up 2 minutes   0.0.0.0:5002->80/tcp, :::5002->80/tcp       php_apache
[banner@stapp03 data]$ 

```

<img width="2416" height="1166" alt="image" src="https://github.com/user-attachments/assets/001f9b75-8fa6-49d4-aa57-5fdd653fbbff" />
<img width="2395" height="1191" alt="image" src="https://github.com/user-attachments/assets/cb21a9d7-8af9-4d15-b8da-f060e8b6e2de" />


```sh
[banner@stapp03 data]$ history
    1  ls /opt/data/
    2  ls ll /opt/data/
    3  ls -ll /opt/data/
    4  sudo vi /opt/data/docker-compose.yml
    5  cat /opt/data/docker-compose.yml
    6  sudo docker compose up -d
    7  sudo docker compose up -d /opt/data/docker-compose.yml
    8  cd /opt/data/
    9  sudo docker compose up -d
   10  sudo vi /opt/data/docker-compose.yml
   11  cat /opt/data/docker-compose.yml
   12  sudo docker compose up -d
   13  sudo docker compose ps
   14  sudo docker ps
   15  history
[banner@stapp03 data]$

```

