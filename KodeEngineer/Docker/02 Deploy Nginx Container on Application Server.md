# Deploy Nginx Container on Application Server

The Nautilus DevOps team is conducting application deployment tests on selected application servers. They require a nginx container deployment on Application Server 1. Complete the task with the following instructions:


On Application Server 1 create a container named nginx_1 using the nginx image with the alpine tag. Ensure container is in a running state.


<img width="877" height="455" alt="image" src="https://github.com/user-attachments/assets/2b6ee61a-72c7-474a-86b7-3e1d4d153d89" />

<img width="2327" height="1067" alt="image" src="https://github.com/user-attachments/assets/f240b331-2338-488f-a841-f9d778d916df" />

```sh
thor@jump-host ~$ ssh tony@stapp01
The authenticity of host 'stapp01 (10.244.189.198)' can't be established.
ED25519 key fingerprint is SHA256:uMY9H/pnoZN5q+1Dv7BaFNe66SxS5iWSTCAZU3Osrn4.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp01' (ED25519) to the list of known hosts.
tony@stapp01's password: 
[tony@stapp01 ~]$ 
[tony@stapp01 ~]$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
[tony@stapp01 ~]$ docker run -d --name nginx_1 nginx:apine
Unable to find image 'nginx:apine' locally
docker: Error response from daemon: manifest for nginx:apine not found: manifest unknown: manifest unknown.
See 'docker run --help'.
[tony@stapp01 ~]$ docker run -d --name nginx_1 nginx:alpine
Unable to find image 'nginx:alpine' locally
alpine: Pulling from library/nginx
55afa1ecc21d: Pull complete 
d94291c26261: Pull complete 
0ea935727878: Pull complete 
1ed8e39a7434: Pull complete 
0d62d88506ba: Pull complete 
8cdfe4f23778: Pull complete 
da4dea1b00af: Pull complete 
fb597529c916: Pull complete 
Digest: sha256:db35bfc6b2951e7f8a72db5db120288c127ffaeeb4a6d4b95a26fead017d5913
Status: Downloaded newer image for nginx:alpine
0f7cf5d83e7364100abd4dc926077d1d7907460a8d52c6eb761cf7901f4cade4
[tony@stapp01 ~]$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS         PORTS     NAMES
0f7cf5d83e73   nginx:alpine   "/docker-entrypoint.…"   10 seconds ago   Up 9 seconds   80/tcp    nginx_1
[tony@stapp01 ~]$ history
    1  docker ps
    2  docker run -d --name nginx_1 nginx:apine
    3  docker run -d --name nginx_1 nginx:alpine
    4  docker ps
    5  history
[tony@stapp01 ~]$ 


```


<img width="2418" height="1075" alt="image" src="https://github.com/user-attachments/assets/a92443c0-5b6b-49bd-85de-f9159a6c1af7" />
