# Delete Docker Container

<img width="1018" height="432" alt="image" src="https://github.com/user-attachments/assets/ab6f7146-4f88-4a2a-9d09-b243a87112b3" />

<img width="2427" height="1082" alt="image" src="https://github.com/user-attachments/assets/c60c38d5-ef00-434f-aece-260f10d80417" />

A container named kke-container was created by one of the Nautilus project developers on App Server 3. It was solely for testing purposes and now requires deletion. Execute the following task:

Delete the kke-container on App Server 3 in Stratos DC.


```sh
thor@jump-host ~$ docker ps
bash: docker: command not found
thor@jump-host ~$ ssh banner@stapp03
The authenticity of host 'stapp03 (10.244.195.44)' can't be established.
ED25519 key fingerprint is SHA256:mZnpEmRk279BbSIEH8CaTLP2VPSZg3cdNUSrJsmKkow.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp03' (ED25519) to the list of known hosts.
banner@stapp03's password: 
Permission denied, please try again.
banner@stapp03's password: 
Last failed login: Fri Aug 21 08:20:14 UTC 2026 from 10.244.97.177 on ssh:notty
There was 1 failed login attempt since the last successful login.
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ docker ps
CONTAINER ID   IMAGE     COMMAND               CREATED         STATUS         PORTS     NAMES
21f1370c8007   busybox   "tail -f /dev/null"   4 minutes ago   Up 4 minutes             kke-container
[banner@stapp03 ~]$ docker rm kke-container
Error response from daemon: cannot remove container "/kke-container": container is running: stop the container before removing or force remove
[banner@stapp03 ~]$ docker rm 21f1370c8007
Error response from daemon: cannot remove container "/kke-container": container is running: stop the container before removing or force remove
[banner@stapp03 ~]$ docker stop 21f1370c8007
21f1370c8007
[banner@stapp03 ~]$ docker rm 21f1370c8007
21f1370c8007
[banner@stapp03 ~]$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ history
    1  docker ps
    2  docker rm kke-container
    3  docker rm 21f1370c8007
    4  docker stop 21f1370c8007
    5  docker rm 21f1370c8007
    6  docker ps
    7  history
[banner@stapp03 ~]$

```

<img width="2402" height="1212" alt="image" src="https://github.com/user-attachments/assets/c82ddde3-8172-4c56-a1c4-c09f386d167f" />
<img width="2363" height="1115" alt="image" src="https://github.com/user-attachments/assets/3ec98ba1-e455-438b-a61e-5731c7f06b8a" />








