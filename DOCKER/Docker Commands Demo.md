```sh
docker run centos


docker run centos bash

docker run -it centos bash
```

<img width="2025" height="871" alt="image" src="https://github.com/user-attachments/assets/087df3e3-b3be-433d-b51a-949e06c0d98d" />


```sh
cat /etc/*release*

exit
```

```sh
docker ps

# docker run centos sleep 20

# run it in detached mode to return back to the terminal
docker run -d centos sleep 20

docker ps

# after 20 seconds you won't be able to see the list if you ran docker ps
docker ps
```

```sh
docker ps -a
```


<img width="2055" height="748" alt="image" src="https://github.com/user-attachments/assets/fbb8695b-f953-45fa-9f14-48a6dff81e9f" />

```sh
docker run -d centos sleep 2000

docker ps
```

<img width="2027" height="331" alt="image" src="https://github.com/user-attachments/assets/6e41da55-0391-4c79-bf10-84e738666eeb" />

```sh
docker stop # <Name> or <containerID>

docker ps

docker ps -a
````
<img width="2058" height="642" alt="image" src="https://github.com/user-attachments/assets/383e5b9f-6235-463b-99c0-96288696f87c" />


```sh
docker rm <contianerID>
docker rm <Name>
docker ps -a
```
<img width="2052" height="962" alt="image" src="https://github.com/user-attachments/assets/29f96358-ae4d-48dc-9784-ac2283162117" />


```sh
docker rm <starting few characters of multiple containerID>

# example
docker rm 345 e0a 773
```
<img width="2397" height="1136" alt="image" src="https://github.com/user-attachments/assets/fee92333-442a-4a0a-b3ba-e9bc573416b4" />
<img width="2452" height="898" alt="image" src="https://github.com/user-attachments/assets/eaedfb9e-3fc9-4aa9-9b82-9f42462e8f76" />
<img width="2423" height="1043" alt="image" src="https://github.com/user-attachments/assets/ed92f3d7-d6bc-4ee7-bf9c-9d338cc1425d" />


```sh
docker images

```
<img width="1731" height="383" alt="image" src="https://github.com/user-attachments/assets/00cbf4ba-3dce-4ad5-8fa3-8411ad539c17" />

### Docker rm is used for containers and Docker rmi is used for Images

```sh
# docker rmi 
docker rmi busybox
```
<img width="1855" height="858" alt="image" src="https://github.com/user-attachments/assets/9d52b21f-04b5-4589-a2cf-de8169a1571b" />

<img width="2471" height="793" alt="image" src="https://github.com/user-attachments/assets/b87414bf-42e6-4a9b-b388-c35cb2f3e91f" />

<img width="2420" height="533" alt="image" src="https://github.com/user-attachments/assets/d2f69d02-0833-4ba0-aa6d-b9a1fcf9fe13" />
<img width="2397" height="642" alt="image" src="https://github.com/user-attachments/assets/80501522-2118-40c7-a0bc-46217adbcf76" />
<img width="1730" height="717" alt="image" src="https://github.com/user-attachments/assets/3b6477eb-84be-430b-9042-940436f1e233" />
<img width="2312" height="317" alt="image" src="https://github.com/user-attachments/assets/664df03d-4d26-465e-99d3-b110b837a096" />

# if you dont want to pull immediately and if you just want to pull an image and just to keep it for later, whenever you wish to run it:
```sh
docker pull ubuntu
```

<img width="2387" height="661" alt="image" src="https://github.com/user-attachments/assets/8d3d0275-9de2-4a7e-8771-21cc9f6154e2" />

<img width="1557" height="207" alt="image" src="https://github.com/user-attachments/assets/b29ad177-e8a8-4b13-9e14-b2c92299a538" />
<img width="2466" height="428" alt="image" src="https://github.com/user-attachments/assets/49f97ad3-b6a3-4dd0-81f8-4e5b111ae96c" />



```sh
docker exec <containerID> cat /etc/*release*
```

<img width="2407" height="723" alt="image" src="https://github.com/user-attachments/assets/b361c8e4-abee-42b0-8f89-b7990b37172b" />

















