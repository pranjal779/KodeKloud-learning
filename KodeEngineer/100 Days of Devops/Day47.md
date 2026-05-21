# Day 47: Docker Python App

[reference](https://dev.to/wycliffealphus/100-days-of-devops-day-47-1bo9)

A python app needed to be Dockerized, and then it needs to be deployed on App Server 2.  
We have already copied a requirements.txt file (having the app dependencies) under /python_app/src/ directory on App Server 2.  
Further complete this task as per details mentioned below:  

Create a Dockerfile under /python_app directory:  
Use any python image as the base image.  
Install the dependencies using requirements.txt file.  
Expose the port 6000.  
Run the server.py script using CMD.  

Build an image named nautilus/python-app using this Dockerfile.  

Once image is built, create a container named pythonapp_nautilus:  

Map port 6000 of the container to the host port 8092.  

Once deployed, you can test the app using curl command on App Server 2.
curl http://localhost:8092/  


<img width="822" height="782" alt="image" src="https://github.com/user-attachments/assets/7817b87c-25a8-4604-b028-0db604218b19" />


```sh
thor@jump-host ~$ ssh steve@stapp02
The authenticity of host 'stapp02 (10.244.195.251)' can't be established.
ED25519 key fingerprint is SHA256:MLcuj8AzRvNzXPAog4U/bvhtRsvQLKkbogE2P11mgfM.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp02' (ED25519) to the list of known hosts.
steve@stapp02's password: 
[steve@stapp02 ~]$ ls /python_app/src/
requirements.txt  server.py
[steve@stapp02 ~]$ cat /python_app/src/requirements.txt 
flask[steve@stapp02 ~]$ 

flask[steve@stapp02 ~]$ cat /python_app/src/server.py 
from flask import Flask

# the all-important app variable:
app = Flask(__name__)

@app.route("/")
def hello():
    return "Welcome to xFusionCorp Industries!"

if __name__ == "__main__":
        app.config['TEMPLATES_AUTO_RELOAD'] = True
        app.run(host='0.0.0.0', debug=True, port=6000)[steve@stapp02 ~]$ 


[steve@stapp02 python_app]$ cat Dockerfile
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMP["python", "app.py"]
[steve@stapp02 python_app]$


# rewrote the file
[steve@stapp02 python_app]$ cat Dockerfile
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY src/ .

EXPOSE 6000

CMP["python", "server.py"]
[steve@stapp02 python_app]$


[steve@stapp02 python_app]$ pwd
/python_app
[steve@stapp02 python_app]$ cd ..
[steve@stapp02 /]$ cd ..
[steve@stapp02 /]$ cd ~
[steve@stapp02 ~]$ pwd
/home/steve
[steve@stapp02 ~]$ cd ..
[steve@stapp02 home]$ cd ~
[steve@stapp02 ~]$ ls -la
total 20
drwx------ 2 steve steve 4096 May 21 13:22 .
drwxr-xr-x 1 root  root  4096 May 21 13:22 ..
-rw-r--r-- 1 steve steve   18 Feb 15  2024 .bash_logout
-rw-r--r-- 1 steve steve  141 Feb 15  2024 .bash_profile
-rw-r--r-- 1 steve steve  492 Feb 15  2024 .bashrc
[steve@stapp02 ~]$ ls -ll
total 0
[steve@stapp02 ~]$ cd /
[steve@stapp02 /]$ ls -ll
total 80
dr-xr-xr-x    2 root   root   4096 Jun 25  2024 afs
lrwxrwxrwx    1 root   root      7 Jun 25  2024 bin -> usr/bin
dr-xr-xr-x    2 root   root   4096 Jun 25  2024 boot
drwxr-xr-x    7 root   root    460 May 21 13:22 dev
-rwxrwxr-x    1 root   root   1328 Feb  9 04:52 entrypoint.sh
drwxr-xr-x    1 root   root   4096 May 21 13:22 etc
drwxr-xr-x    1 root   root   4096 May 21 13:22 home
lrwxrwxrwx    1 root   root      7 Jun 25  2024 lib -> usr/lib
lrwxrwxrwx    1 root   root      9 Jun 25  2024 lib64 -> usr/lib64
drwx------    2 root   root   4096 Jul  8  2024 lost+found
drwxr-xr-x    2 root   root   4096 Jun 25  2024 media
drwxr-xr-x    2 root   root   4096 Jun 25  2024 mnt
drwxr-xr-x    1 root   root   4096 May 21 13:22 opt
dr-xr-xr-x 1241 root   root      0 May 21 13:22 proc
drwxr-xr-x    3 root   root   4096 May 21 13:54 python_app
dr-xr-x---    1 root   root   4096 Jul 10  2024 root
drwxr-xr-x   21 root   root    560 May 21 13:22 run
lrwxrwxrwx    1 root   root      8 Jun 25  2024 sbin -> usr/sbin
drwxr-xr-x    2 root   root   4096 Jun 25  2024 srv
dr-xr-xr-x   13 nobody nobody    0 Mar 16 16:26 sys
drwxrwxrwt   10 root   root   4096 May 21 13:42 tmp
drwxr-xr-x    1 root   root   4096 Jul  8  2024 usr
drwxr-xr-x    1 root   root   4096 May 21 13:22 var
[steve@stapp02 /]$
[steve@stapp02 python_app]$ ls 
Dockerfile  src
[steve@stapp02 python_app]$ ls src/
requirements.txt  server.py
[steve@stapp02 python_app]$

[steve@stapp02 python_app]$ # Build an image named nautilus/python-app using this Dockerfile.
[steve@stapp02 python_app]$ docker build -t nautilus/python-app .
[+] Building 0.2s (1/1) FINISHED                                                                             docker:default
 => [internal] load build definition from Dockerfile                                                                   0.1s
 => => transferring dockerfile: 206B                                                                                   0.0s
Dockerfile:13
--------------------
  11 |     EXPOSE 6000
  12 |     
  13 | >>> CMP["python", "server.py"]
  14 |     
--------------------
ERROR: failed to build: failed to solve: dockerfile parse error on line 13: unknown instruction: CMP["python",
[steve@stapp02 python_app]$ 

[steve@stapp02 python_app]$ sudo vi Dockerfile 
[sudo] password for steve: 
[steve@stapp02 python_app]$ cat Dockerfile 
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY src/ .

EXPOSE 6000

CMD["python", "server.py"]
[steve@stapp02 python_app]$

[steve@stapp02 python_app]$ # Build an image named nautilus/python-app using this Dockerfile.
[steve@stapp02 python_app]$ docker build -t nautilus/python-app .
[+] Building 0.1s (1/1) FINISHED                                                                             docker:default
 => [internal] load build definition from Dockerfile                                                                   0.0s
 => => transferring dockerfile: 206B                                                                                   0.0s
Dockerfile:13
--------------------
  11 |     EXPOSE 6000
  12 |     
  13 | >>> CMD["python", "server.py"]
  14 |     
--------------------
ERROR: failed to build: failed to solve: dockerfile parse error on line 13: unknown instruction: CMD["python",


[steve@stapp02 python_app]$ sudo vi Dockerfile 
[steve@stapp02 python_app]$ cat Dockerfile 
FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY src/ .

EXPOSE 6000

CMD ["python", "server.py"]
[steve@stapp02 python_app]$ # Build an image named nautilus/python-app using this Dockerfile.
[steve@stapp02 python_app]$ docker build -t nautilus/python-app .
[+] Building 1.8s (7/9)                                                                                      docker:default
 => [internal] load build definition from Dockerfile                                                                   0.0s
 => => transferring dockerfile: 207B                                                                                   0.0s
 => [internal] load metadata for docker.io/library/python:3.12-slim                                                    1.5s
 => [internal] load .dockerignore                                                                                      0.0s
 => => transferring context: 2B                                                                                        0.0s
 => CANCELED [1/5] FROM docker.io/library/python:3.12-slim@sha256:9d3abd9fc11d06998ccdbdd93b4dd49b5ad7d67fcbbc11c016e  0.1s
 => => resolve docker.io/library/python:3.12-slim@sha256:9d3abd9fc11d06998ccdbdd93b4dd49b5ad7d67fcbbc11c016eb0eb2c219  0.1s
 => => sha256:9d3abd9fc11d06998ccdbdd93b4dd49b5ad7d67fcbbc11c016eb0eb2c2194891 10.37kB / 10.37kB                       0.0s
 => => sha256:866411c135b507754efdf2fda51484be4d3d7d5173ed53cd083106132e710904 1.75kB / 1.75kB                         0.0s
 => [internal] load build context                                                                                      0.1s
 => => transferring context: 401B                                                                                      0.0s
 => CACHED [2/5] WORKDIR /app                                                                                          0.0s
 => ERROR [3/5] COPY requirements.txt .                                                                                0.0s
------
 > [3/5] COPY requirements.txt .:
------
Dockerfile:5
--------------------
   3 |     WORKDIR /app
   4 |     
   5 | >>> COPY requirements.txt .
   6 |     
   7 |     RUN pip install --no-cache-dir -r requirements.txt
--------------------
ERROR: failed to build: failed to solve: failed to compute cache key: failed to calculate checksum of ref 2f5a7577-2ed1-4824-a5d0-890274512b9e::mkmalk3vhypkebhgw0mngzr6s: "/requirements.txt": not found
[steve@stapp02 python_app]$


[steve@stapp02 python_app]$ sudo vi Dockerfile 
[steve@stapp02 python_app]$ cat Dockerfile 
FROM python:3.12-slim

WORKDIR /app

COPY src/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY src/ .

EXPOSE 6000

CMD ["python", "server.py"]
[steve@stapp02 python_app]$ # Build an image named nautilus/python-app using this Dockerfile.
[steve@stapp02 python_app]$ docker build -t nautilus/python-app .
[+] Building 9.1s (10/10) FINISHED                                                                           docker:default
 => [internal] load build definition from Dockerfile                                                                   0.0s
 => => transferring dockerfile: 211B                                                                                   0.0s
 => [internal] load metadata for docker.io/library/python:3.12-slim                                                    0.4s
 => [internal] load .dockerignore                                                                                      0.0s
 => => transferring context: 2B                                                                                        0.0s
 => [1/5] FROM docker.io/library/python:3.12-slim@sha256:9d3abd9fc11d06998ccdbdd93b4dd49b5ad7d67fcbbc11c016eb0eb2c219  4.0s
 => => resolve docker.io/library/python:3.12-slim@sha256:9d3abd9fc11d06998ccdbdd93b4dd49b5ad7d67fcbbc11c016eb0eb2c219  0.0s
 => => sha256:866411c135b507754efdf2fda51484be4d3d7d5173ed53cd083106132e710904 1.75kB / 1.75kB                         0.0s
 => => sha256:e1054bc5a9f2ddbdd6d0247997c45f2201a4e9b4c6f824b247064a558e877070 5.65kB / 5.65kB                         0.0s
 => => sha256:5b4d6ff92fc4e14e911b7753c954fac965d48c40fe1075758d284148ccace970 29.78MB / 29.78MB                       0.6s
 => => sha256:4a9dde5cdde190bfa0a3ab17863a083e66ea9636b157638c315357dfa476ba76 1.29MB / 1.29MB                         0.5s
 => => sha256:e113665b194b20ba7e9093ef6a1a38edbaebbfb983c00e379a45a142a95a86ef 12.11MB / 12.11MB                       0.5s
 => => sha256:9d3abd9fc11d06998ccdbdd93b4dd49b5ad7d67fcbbc11c016eb0eb2c2194891 10.37kB / 10.37kB                       0.0s
 => => sha256:07342fe545e640a2c4960e97ffe33a301cd8e61e0c4d4307d7ac66b6b8a9eb2d 250B / 250B                             0.7s
 => => extracting sha256:5b4d6ff92fc4e14e911b7753c954fac965d48c40fe1075758d284148ccace970                              1.0s
 => => extracting sha256:4a9dde5cdde190bfa0a3ab17863a083e66ea9636b157638c315357dfa476ba76                              0.2s
 => => extracting sha256:e113665b194b20ba7e9093ef6a1a38edbaebbfb983c00e379a45a142a95a86ef                              0.7s
 => => extracting sha256:07342fe545e640a2c4960e97ffe33a301cd8e61e0c4d4307d7ac66b6b8a9eb2d                              0.1s
 => [internal] load build context                                                                                      0.0s
 => => transferring context: 97B                                                                                       0.0s
 => [2/5] WORKDIR /app                                                                                                 0.1s
 => [3/5] COPY src/requirements.txt .                                                                                  0.1s
 => [4/5] RUN pip install --no-cache-dir -r requirements.txt                                                           3.2s
 => [5/5] COPY src/ .                                                                                                  0.1s 
 => exporting to image                                                                                                 1.0s 
 => => exporting layers                                                                                                0.9s 
 => => writing image sha256:c572d44470c08b04378159954c770fa186b289619cc52abbefbbe907ca8c1ede                           0.0s 
 => => naming to docker.io/nautilus/python-app                                                                         0.0s 
[steve@stapp02 python_app]$                                                                                                 



[steve@stapp02 python_app]$ docker run -d --name pythonapp_nautilus -p 8092:6000
"docker run" requires at least 1 argument.
See 'docker run --help'.

Usage:  docker run [OPTIONS] IMAGE [COMMAND] [ARG...]

Create and run a new container from an image
[steve@stapp02 python_app]$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
[steve@stapp02 python_app]$ docker images
REPOSITORY            TAG       IMAGE ID       CREATED              SIZE
nautilus/python-app   latest    c572d44470c0   About a minute ago   132MB
[steve@stapp02 python_app]$

[steve@stapp02 python_app]$ docker ps
CONTAINER ID   IMAGE                 COMMAND              CREATED         STATUS         PORTS                                       NAMES
a7d62cd809b5   nautilus/python-app   "python server.py"   4 seconds ago   Up 3 seconds   0.0.0.0:8092->6000/tcp, :::8092->6000/tcp   pythonapp_nautilus
[steve@stapp02 python_app]$

[steve@stapp02 python_app]$ docker build --check .
[+] Building 2.7s (5/5) FINISHED                                                                              docker:default
 => [internal] load build definition from Dockerfile                                                                    0.0s
 => => transferring dockerfile: 211B                                                                                    0.0s
 => resolve image config for docker-image://docker.io/docker/dockerfile:1.8.1@sha256:e87caa74dcb7d46cd820352bfea12591f  1.2s
 => docker-image://docker.io/docker/dockerfile:1.8.1@sha256:e87caa74dcb7d46cd820352bfea12591f3dba3ddc4285e19c7dcd13359  0.6s
 => => resolve docker.io/docker/dockerfile:1.8.1@sha256:e87caa74dcb7d46cd820352bfea12591f3dba3ddc4285e19c7dcd13359f7ce  0.0s
 => => sha256:e87caa74dcb7d46cd820352bfea12591f3dba3ddc4285e19c7dcd13359f7cefd 8.40kB / 8.40kB                          0.0s
 => => sha256:dde28735fbb848299b7a43b7561d828b89c76f84f745c31896a7a7efbf93851a 482B / 482B                              0.0s
 => => sha256:265d11c3a0f3387fc23a28141d04918dae4cfa0b0ff311f958e05b23f772db95 1.26kB / 1.26kB                          0.0s
 => => sha256:1d7e21b9eae3317824ebc8707e591a810a37dff6aff8e1d175f7d8c95a3aa532 12.09MB / 12.09MB                        0.3s
 => => extracting sha256:1d7e21b9eae3317824ebc8707e591a810a37dff6aff8e1d175f7d8c95a3aa532                               0.2s
 => [internal] load metadata for docker.io/library/python:3.12-slim                                                     0.6s
 => [internal] load .dockerignore                                                                                       0.0s
 => => transferring context: 2B                                                                                         0.0s
Check complete, no warnings found.
[steve@stapp02 python_app]$


[steve@stapp02 python_app]$ curl http://localhost:8092/
Welcome to xFusionCorp Industries![steve@stapp02 python_app]$ 




```



<img width="2402" height="1191" alt="image" src="https://github.com/user-attachments/assets/d626205f-b6d0-4176-a8cf-4ba6b705c1e7" />


```sh
[steve@stapp02 python_app]$ curl http://localhost:8092/
Welcome to xFusionCorp Industries![steve@stapp02 python_app]$ history
    1  ls /python_app/src/
    2  cat /python_app/src/requirements.txt 
    3  cat /python_app/src/server.py 
    4  cd /python_app/
    5  sudo vi Dockerfile
    6  cat Dockerfile
    7  sudo vi Dockerfile
    8  cat Dockerfile
    9  pwd
   10  cd ..
   11  cd ~
   12  pwd
   13  cd ..
   14  cd ~
   15  ls -la
   16  ls -ll
   17  cd /
   18  ls -ll
   19  cd python_app/
   20  ls 
   21  ls src/
   22  clear
   23  # Build an image named nautilus/python-app using this Dockerfile.
   24  docker build -t nautilus/python-app .
   25  sudo vi Dockerfile 
   26  cat Dockerfile 
   27  # Build an image named nautilus/python-app using this Dockerfile.
   28  docker build -t nautilus/python-app .
   29  sudo vi Dockerfile 
   30  cat Dockerfile 
   31  # Build an image named nautilus/python-app using this Dockerfile.
   32  docker build -t nautilus/python-app .
   33  sudo vi Dockerfile 
   34  cat Dockerfile 
   35  # Build an image named nautilus/python-app using this Dockerfile.
   36  docker build -t nautilus/python-app .
   37  docker run -d --name pythonapp_nautilus -p 8092:6000
   38  docker ps
   39  docker images
   40  docker run --help
   41  docker images
   42  docker run -d --name pythonapp_nautilus -p 8092:6000 nautilus/python-app
   43  docker ps
   44  docker build --check .
   45  curl http://localhost:8092/
   46  history
[steve@stapp02 python_app]$ 


```


Testing a Docker build involves everything from linting your Dockerfile to verifying the final running application. Depending on your needs, you can test at different stages: [1, 2]    
1. Static Validation (Pre-Build)   
Before even building the image, you can check your Dockerfile for errors or best practice violations.  

docker build --check .  

• Docker Build Checks: Use the  flag to validate your configuration without actually building an image.   
• Linting: Use tools like Hadolint to catch common mistakes and security issues in your Dockerfile.   [6, 7, 8, 9, 10]  

2. Testing During the Build  
You can incorporate tests directly into the build process so that a failed test prevents the image from being created. 

docker build --target test -t my-app-test .  

• Multi-Stage Builds: Create a specific  stage in your Dockerfile. Use  to execute your test suite (e.g.,  or ).  
• Targeted Testing: Build only up to that stage to see the results without producing a final production image.  [13, 14, 15, 16, 17]  

3. Functional Testing (Post-Build) 
Once the image is built, verify it works as expected by running it as a container.

docker run -it --rm my-image-name /bin/bash

• Manual Smoke Test: Start the container and interact with it to ensure it launches correctly.  
• Automated Verification: Use scripts to check if specific files exist or if the application returns the expected output.  
• Health Checks: Define a  in your Dockerfile. This allows Docker to periodically run a command (like a  request) inside the container to monitor its status.  [21, 22, 23, 24, 25]  

4. Continuous Integration (CI) 
Automate these tests in your pipeline (e.g.,  GitHub Actions 
 or GitLab CI).



• Docker Compose: Use  to spin up your application along with its dependencies (like databases) to run integration tests. 
• Vulnerability Scanning: Use tools like Docker Scout or Trivy during your CI process to check for security vulnerabilities in the final image. [8, 28, 29, 30, 31]  

AI responses may include mistakes.

[1] https://oneuptime.com/blog/post/2026-01-30-docker-images-test-stages/view  
[2] https://github.com/fi-ts/docker-make  
[3] https://www.datacamp.com/tutorial/how-to-containerize-application-using-docker  
[4] https://severalnines.com/blog/mysql-docker-building-container-image/  
[5] https://wearecommunity.io/communities/36148Gdy5W/articles/6187  
[6] https://oneuptime.com/blog/post/2026-02-08-how-to-use-docker-build-checks-for-dockerfile-validation/view  
[7] https://www.docker.com/blog/introducing-docker-build-checks/  
[8] https://www.youtube.com/watch?v=aZzV6X7XhyI  
[9] https://vsupalov.com/docker-setup-broken/  
[10] https://itnext.io/a-practical-guide-to-containerize-your-rust-application-with-docker-77e8a391b4a8  
[11] https://oneuptime.com/blog/post/2026-01-30-docker-images-test-stages/view  
[12] https://realpython.com/docker-continuous-integration/  
[13] https://docs.docker.com/guides/java/run-tests/  
[14] https://docs.docker.com/guides/bake/  
[15] https://www.docker.com/blog/introducing-docker-build-checks/  
[16] https://dev.to/oluwajubelo1/docker-multi-stage-builds-your-secret-weapon-for-lean-mean-container-machines-hl8  
[17] https://notes.kodekloud.com/docs/Docker-Certified-Associate-Exam-Course/Docker-Image-Management/Multi-Stage-Builds/page  
[18] https://labex.io/tutorials/docker-how-to-use-docker-buildx-history-open-command-to-view-build-details-555054  
[19] https://www.sentinelone.com/blog/create-docker-image-2/  
[20] https://oneuptime.com/blog/post/2026-03-16-build-image-dockerfile-podman/view  
[21] https://medium.com/@michamarszaek/how-to-test-dockerfiles-9a208dded84b  
[22] https://stackoverflow.com/questions/30159783/how-to-test-the-container-or-image-after-docker-build  
[23] https://www.dash0.com/guides/docker-health-check-a-practical-guide  
[24] https://docs.docker.com/get-started/workshop/02_our_app/  
[25] https://blog.stackademic.com/how-enterprises-turn-code-into-container-images-real-devops-workflow-bdd88191d373  
[26] https://docs.docker.com/build/ci/github-actions/test-before-push/  
[27] https://www.youtube.com/watch?v=fymJsLIwrFU  
[28] https://www.docker.com/blog/how-to-build-and-test-your-docker-images-in-the-cloud-with-docker-hub/  
[29] https://docs.docker.com/guides/dotnet/run-tests/  
[30] https://www.youtube.com/watch?v=DQdB7wFEygo  
[31] https://daviws.medium.com/using-docker-for-integration-tests-dfc02b5ffc8c

