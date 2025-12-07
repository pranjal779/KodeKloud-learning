This is an update for the Jenkins image.

In our upcoming demo video, I used a jenkins image which is now deprecated. Instead of that, we have to use jenkins/jenkins.

In the demo video, I used the command:-

docker run jenkins

But as of now, we have to use the following command:-

docker run jenkins/jenkins

Reference:-
 
https://www.jenkins.io/blog/2018/12/10/the-official-Docker-image/ 

https://hub.docker.com/r/jenkins/jenkins/ 


# Demo - Advanced Docker Run Features

```sh
docker ps
docker run ubuntu
docker run ubuntu cat /etc/*release*
docker run ubuntu:17.10 cat /etc/*release*
```

<img width="1492" height="828" alt="image" src="https://github.com/user-attachments/assets/704523bf-cd00-48e4-bab7-0213de04ccd0" />

```sh
docker run ubuntu sleep 15 # keeping it alive for that many seconds
docker run ubuntu sleep 1500 # stop the dontainer in a different tab
```

<img width="2007" height="680" alt="image" src="https://github.com/user-attachments/assets/5516e60a-e116-44db-b65c-597f8491154e" />

```sh
docker run -d ubuntu sleep 100
docker ps
```
<img width="2030" height="257" alt="image" src="https://github.com/user-attachments/assets/b6df8a01-d4b1-42b9-ad5f-8cd18058d11d" />

```sh
docker attach <containID>
# stop the container from another host / terminal tab
docker run timer
docker run -d timer
docker ps
docker attach <containID> # you will see the output again

```

This is an update for the Jenkins image.

In our upcoming demo video, I used a jenkins image which is now deprecated. Instead of that, we have to use jenkins/jenkins.

In the demo video, I used the command:-

docker run jenkins

But as of now, we have to use the following command:-

docker run jenkins/jenkins

Reference:-
 
https://www.jenkins.io/blog/2018/12/10/the-official-Docker-image/ 

https://hub.docker.com/r/jenkins/jenkins/ 

```sh
docker run jenkins
```

<img width="1501" height="805" alt="image" src="https://github.com/user-attachments/assets/f92618ca-059c-4d3a-a045-65a428c6a14a" />
<img width="1802" height="1061" alt="image" src="https://github.com/user-attachments/assets/5e0df70e-d308-4027-98a2-59803d95f529" />

## In the Docker Host
```sh
docker ps
# to find out the internal IP of the Jenkins Container
docker inspect <container ID>

```

<img width="1622" height="503" alt="image" src="https://github.com/user-attachments/assets/35d3ea05-042d-458c-8498-952fc514cf1c" />
<img width="1830" height="895" alt="image" src="https://github.com/user-attachments/assets/ecac1baa-21e0-4000-b84d-ebb0f2112a92" />

**follow the IP address and the port foe example: 712.17.0.2:8080 to reach the Jenkins Login Page**
## How to access it externally?
- go to the IP of Docker Host
- you wont be able to access to Jenkins with the Docker Host IP:<port>
- stop the docker container
- and run the following command ```sh docker run -p 8080:8080 jenkins``` # this is called port mapping
- refresh the browser and now you will be able to se the Jenkins page

<img width="1657" height="1405" alt="image" src="https://github.com/user-attachments/assets/72e327e1-5ec1-4dd2-a853-6e3c7b751548" />


<img width="672" height="170" alt="image" src="https://github.com/user-attachments/assets/94e0b49d-3e20-4680-881d-bead9093416b" />
**Refresh the Jenkins Page and you wont be able to access it**

<img width="987" height="192" alt="image" src="https://github.com/user-attachments/assets/539a5e32-6dc8-42a6-9faa-bbdad3ecd5be" />
**refresh the jenkins page it will run now**

```sh
mkdir my-jenkins-data
```


<img width="1772" height="272" alt="image" src="https://github.com/user-attachments/assets/0832dba9-f9aa-46cf-9f74-add1985a85af" />
<img width="1822" height="1157" alt="image" src="https://github.com/user-attachments/assets/b6483b99-efcf-4e6f-8e05-b40ff9368206" />


```sh
docker run -p 8080:8080 -v /root/my-jenkins-data:/var/jenins_home -u root jenkins
```

1. Stop the container
2. run ```sh docker ps```
3. <img width="2235" height="372" alt="image" src="https://github.com/user-attachments/assets/461546b8-68c0-4976-814f-51dff983b546" />
4. run the command ```sh docker run -p 8080:8080 -v /root/my-jenkins-data:/var/jenkins_home -u root jenkins```
5. the jenkins page will be up and running, log in
6. and you can see your progress is saved
7. Basically you are mapping the containers Data to a Directory



