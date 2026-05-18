# Day 45: Resolve Dockerfile Issues

[reference 1](https://tundedamian.medium.com/day-45-of-100-days-of-devops-fixing-a-broken-docker-build-0c028bca5052)
[reference 2](https://dev.to/wycliffealphus/100-days-of-devops-day-45-281f)

<img width="826" height="517" alt="image" src="https://github.com/user-attachments/assets/fc506868-11bd-49af-8ccd-224e5f86f728" />


The Nautilus DevOps team is working to create new images per requirements shared by the development team.  
One of the team members is working to create a Dockerfile on App Server 2 in Stratos DC.  
While working on it she ran into issues in which the docker build is failing and displaying errors.  
Look into the issue and fix it to build an image as per details mentioned below:

a. The Dockerfile is placed on App Server 2 under /opt/docker directory.

b. Fix the issues with this file and make sure it is able to build the image.

c. Do not change base image, any other valid configuration within Dockerfile, or any of the data been used — for example, index.html.

Note: Please note that once you click on FINISH button all the existing containers will be destroyed and new image will be built from your Dockerfile.

```sh
thor@jump-host ~$ ssh steve@stapp02
The authenticity of host 'stapp02 (10.244.240.184)' can't be established.
ED25519 key fingerprint is SHA256:YYD+6r/hDo6AAI1Hgp6+ohYNCbOSkNfOdcyCHZCUvwg.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp02' (ED25519) to the list of known hosts.
steve@stapp02's password: 
[steve@stapp02 ~]$ cd /opt/docker
[steve@stapp02 docker]$ ls
Dockerfile  certs  html
[steve@stapp02 docker]$ cat Dockerfile 
FROM httpd:2.4.43

RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf

RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf/httpd.conf

RUN sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' conf/httpd.conf

RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' conf/httpd.conf

RUN cp certs/server.crt /usr/local/apache2/conf/server.crt

RUN cp certs/server.key /usr/local/apache2/conf/server.key

RUN cp html/index.html /usr/local/apache2/htdocs/

[steve@stapp02 docker]$
[steve@stapp02 docker]$ ls certs/
server.crt  server.key
[steve@stapp02 docker]$ ls html/
index.html


[steve@stapp02 docker]$ sudo vi Dockerfile 
[steve@stapp02 docker]$ cat Dockerfile
FROM httpd:2.4.43

RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf

RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf/httpd.conf

RUN sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' conf/httpd.conf

RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' conf/httpd.conf

RUN COPY certs/server.crt /usr/local/apache2/conf/server.crt

RUN COPY certs/server.key /usr/local/apache2/conf/server.key

RUN COPY html/index.html /usr/local/apache2/htdocs/
[steve@stapp02 docker]$


[steve@stapp02 docker]$ docker build -t my-dockerfile .
[+] Building 10.7s (9/11)                                                                                    docker:default
 => [internal] load build definition from Dockerfile                                                                   0.1s
 => => transferring dockerfile: 569B                                                                                   0.0s
 => [internal] load metadata for docker.io/library/httpd:2.4.43                                                        1.6s
 => [internal] load .dockerignore                                                                                      0.1s
 => => transferring context: 2B                                                                                        0.0s
 => [1/8] FROM docker.io/library/httpd:2.4.43@sha256:cd88fee4eab37f0d8cd04b06ef97285ca981c27b4d685f0321e65c5d4fd49357  6.4s
 => => resolve docker.io/library/httpd:2.4.43@sha256:cd88fee4eab37f0d8cd04b06ef97285ca981c27b4d685f0321e65c5d4fd49357  0.0s
 => => sha256:f1455599cc2e008a4555f14451e590f071371d371a3b87790651a367357d252c 7.35kB / 7.35kB                         0.0s
 => => sha256:bf59529304463f62efa7179fa1a32718a611528cc4ce9f30c0d1bbc6724ec3fb 27.09MB / 27.09MB                       0.9s
 => => sha256:3d3fecf6569b94e406086a2b68a7c8930254490b45c0de4911f497ea9cf0876c 146B / 146B                             0.5s
 => => sha256:b5fc3125d9129e4cdd43f496195cc8f39d43e9bad171044ecb5b8f82b2f6e30d 10.37MB / 10.37MB                       0.8s
 => => sha256:cd88fee4eab37f0d8cd04b06ef97285ca981c27b4d685f0321e65c5d4fd49357 1.86kB / 1.86kB                         0.0s
 => => sha256:53729354a74c9c146aa8726a8906e833755066ada1a478782f4dfb2ea6994b5d 1.37kB / 1.37kB                         0.0s
 => => sha256:3c61041685c0f65e0b375bae6ae6bdeab9b6c20960dbef5e30201db18a4e6d4a 24.47MB / 24.47MB                       1.2s
 => => extracting sha256:bf59529304463f62efa7179fa1a32718a611528cc4ce9f30c0d1bbc6724ec3fb                              1.2s
 => => sha256:34b7e9053f76ca3c9dc574c5034679769256a596008efbfbff1d1b1546600841 298B / 298B                             1.4s
 => => extracting sha256:3d3fecf6569b94e406086a2b68a7c8930254490b45c0de4911f497ea9cf0876c                              0.0s
 => => extracting sha256:b5fc3125d9129e4cdd43f496195cc8f39d43e9bad171044ecb5b8f82b2f6e30d                              0.7s
 => => extracting sha256:3c61041685c0f65e0b375bae6ae6bdeab9b6c20960dbef5e30201db18a4e6d4a                              0.8s
 => => extracting sha256:34b7e9053f76ca3c9dc574c5034679769256a596008efbfbff1d1b1546600841                              0.1s
 => [2/8] RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf                                    0.5s
 => [3/8] RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf/httpd.conf                             0.5s
 => [4/8] RUN sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' conf/httpd.conf         0.5s
 => [5/8] RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' conf/httpd.conf                                   0.5s
 => ERROR [6/8] RUN COPY certs/server.crt /usr/local/apache2/conf/server.crt                                           0.4s
------                                                                                                                      
 > [6/8] RUN COPY certs/server.crt /usr/local/apache2/conf/server.crt:
0.377 /bin/sh: 1: COPY: not found
------
Dockerfile:11
--------------------
   9 |     RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' conf/httpd.conf
  10 |     
  11 | >>> RUN COPY certs/server.crt /usr/local/apache2/conf/server.crt
  12 |     
  13 |     RUN COPY certs/server.key /usr/local/apache2/conf/server.key
--------------------
ERROR: failed to build: failed to solve: process "/bin/sh -c COPY certs/server.crt /usr/local/apache2/conf/server.crt" did not complete successfully: exit code: 127
[steve@stapp02 docker]$

[steve@stapp02 docker]$ sudo vi Dockerfile
[steve@stapp02 docker]$ cat Dockerfile
FROM httpd:2.4.43

RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf

RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf/httpd.conf

RUN sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' conf/httpd.conf

RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' conf/httpd.conf

COPY certs/server.crt /usr/local/apache2/conf/server.crt

COPY certs/server.key /usr/local/apache2/conf/server.key

COPY html/index.html /usr/local/apache2/htdocs/
[steve@stapp02 docker]$

[steve@stapp02 docker]$ docker build -t my-dockerfile .
[+] Building 3.7s (13/13) FINISHED                                                                           docker:default
 => [internal] load build definition from Dockerfile                                                                   0.1s
 => => transferring dockerfile: 557B                                                                                   0.0s
 => [internal] load metadata for docker.io/library/httpd:2.4.43                                                        0.5s
 => [internal] load .dockerignore                                                                                      0.1s
 => => transferring context: 2B                                                                                        0.0s
 => [1/8] FROM docker.io/library/httpd:2.4.43@sha256:cd88fee4eab37f0d8cd04b06ef97285ca981c27b4d685f0321e65c5d4fd49357  0.0s
 => [internal] load build context                                                                                      0.1s
 => => transferring context: 3.19kB                                                                                    0.0s
 => CACHED [2/8] RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf/httpd.conf                             0.0s
 => CACHED [3/8] RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf/httpd.conf                      0.0s
 => CACHED [4/8] RUN sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' conf/httpd.conf  0.0s
 => CACHED [5/8] RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' conf/httpd.conf                            0.0s
 => [6/8] COPY certs/server.crt /usr/local/apache2/conf/server.crt                                                     0.2s
 => [7/8] COPY certs/server.key /usr/local/apache2/conf/server.key                                                     0.2s
 => [8/8] COPY html/index.html /usr/local/apache2/htdocs/                                                              0.2s
 => exporting to image                                                                                                 2.2s
 => => exporting layers                                                                                                2.1s
 => => writing image sha256:f4727af6c9c4805b4fab26cc4d74c6e6a40dcfcbc46e10aa4bed6a13f87feaf2                           0.0s
 => => naming to docker.io/library/my-dockerfile                                                                       0.0s
[steve@stapp02 docker]$ 


```

<img width="2391" height="1147" alt="image" src="https://github.com/user-attachments/assets/ddb24f0b-3727-4854-993d-3297f2d33b0e" />
<img width="2412" height="1176" alt="image" src="https://github.com/user-attachments/assets/a6c6993a-472c-4d71-80c7-4dd5691892f8" />

