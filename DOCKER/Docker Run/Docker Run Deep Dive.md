<img width="1607" height="1395" alt="image" src="https://github.com/user-attachments/assets/59982dcc-e476-4357-8c32-c7248855506e" /># Run - tag
```sh
docker run redis
```
<img width="2027" height="627" alt="image" src="https://github.com/user-attachments/assets/6fb397b1-7b93-441c-ac56-e6fff4288758" />

```sh
docker run redis:4.0
```
<img width="2018" height="1047" alt="image" src="https://github.com/user-attachments/assets/d426f2e4-f6d4-4921-a0f7-e0129a75423f" />

<img width="1992" height="1238" alt="image" src="https://github.com/user-attachments/assets/54509691-5b5f-427b-95c8-d1e7e0a0397b" />


# RUN - STDIN
```sh
./app.sh

docker run kodekloud/simple-prompt-docker
```

### -i for Interactive mode
```sh
docker run -i kodekloud/simple-prompt-docker
```

### -t for sodu terminal can be used with -it for both interactive and sudo terminal
```sh
docker run -it kodekloude/simple-prompt-docker
```

<img width="1607" height="1395" alt="image" src="https://github.com/user-attachments/assets/88603763-3ff4-4c14-9707-920fc38a5fbb" />

# Run - PORT mapping
```sh
docker run kodekloud/webapp

docker run -p 80:5000 kodekloud/webapp

docker run -p 8001:5000 kodekloud/webapp

docker run -p 3306:3306 mysql

docker run -p 8306:3306 mysql
```
<img width="2302" height="1200" alt="image" src="https://github.com/user-attachments/assets/a705b7ad-d97e-4906-8042-6a963b707b8c" />

<img width="2303" height="1230" alt="image" src="https://github.com/user-attachments/assets/defeef7d-b931-4c66-8861-ecb02890ae04" />

<img width="2296" height="1293" alt="image" src="https://github.com/user-attachments/assets/cdc7ee97-e25d-41fc-89f5-e788a43de058" />

```sh
docker run -p 8306:3306 mysql # this will return Docker: error (refer the below image)
```
<img width="1862" height="181" alt="image" src="https://github.com/user-attachments/assets/37450ac7-ba1c-4691-b7dd-ff52137ede6d" />



The "IP of the Docker host" can refer to different things depending on context, specifically whether you are referring to the host machine's IP address from within a Docker container or from outside the Docker environment. 
1. IP of the Docker Host (from the perspective of the host machine or external networks): 
This refers to the standard IP address assigned to the host machine's network interface (e.g., your computer's IP address on your local network or a public IP address if exposed to the internet). This is the IP address you would use to access services running on the host machine from another device on the same network or from the internet. 
To find this, you would typically use commands like: Linux/macOS. 
    ip addr show

or 
    ifconfig

windows. 
    ipconfig

2. Internal IP of the Docker Host (from within a Docker container): 
When running inside a Docker container, the concept of "the Docker host's IP" is usually represented by a special hostname or a specific IP address within the Docker network. 

• host.docker.internal: This is a special DNS name provided by Docker Desktop (on macOS and Windows) that resolves to the IP address of the host machine from within a container. This is the most convenient way to access services running directly on the host from inside a container. 

    ping host.docker.internal

• Default Bridge Gateway: On Linux, or if host.docker.internal is not available, the host's IP address from within a container on the default bridge network is often the gateway IP of that network, which is typically 172.17.0.1. 

    ping 172.17.0.1

In summary: 

• External/Actual Host IP: The IP address of the physical or virtual machine running Docker. 
• Internal Host IP (from container): 
	• host.docker.internal (Docker Desktop) 
	• 172.17.0.1 (Default bridge gateway on Linux/general fallback) 


# RUN - Volume mapping
**How is data presisted in a docker container**
```sh
docker run mysql
```
<img width="2267" height="1142" alt="image" src="https://github.com/user-attachments/assets/d242434b-a5fa-434b-b77c-4eae2dd998d5" />

```sh
docker stop mysql
docker rm mysql
```


https://github.com/user-attachments/assets/31350b5d-41da-48f5-9ee2-20fdb5788268


