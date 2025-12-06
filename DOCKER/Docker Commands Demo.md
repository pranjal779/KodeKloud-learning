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



# Labs: Basic Docker Commands
<img width="1817" height="1095" alt="image" src="https://github.com/user-attachments/assets/041ed7a8-488e-4479-ad52-0c73dca6756d" />

<img width="1022" height="802" alt="image" src="https://github.com/user-attachments/assets/9e52ff7c-1936-4b02-8a44-bc646a8f5cdc" />
<img width="990" height="1203" alt="image" src="https://github.com/user-attachments/assets/1f160256-bc0d-452f-86a6-6fabd21351b0" />
<img width="2012" height="1180" alt="image" src="https://github.com/user-attachments/assets/8c437f46-f4cc-4f90-b173-4d2efcec0db0" />
<img width="2082" height="716" alt="image" src="https://github.com/user-attachments/assets/4e1d8108-561f-444a-a70d-d125aa94405e" />
<img width="2026" height="787" alt="image" src="https://github.com/user-attachments/assets/578d6ed5-04b2-440c-a7ea-16b29ed76411" />
<img width="2497" height="792" alt="image" src="https://github.com/user-attachments/assets/64d57b5d-1f76-4f45-9c22-cd973a15a24d" />
<img width="2491" height="1130" alt="image" src="https://github.com/user-attachments/assets/9ba8feff-cfbe-4f04-ac3d-c9d7d34bf374" />
<img width="2527" height="1140" alt="image" src="https://github.com/user-attachments/assets/3d295bf8-b0d0-43c3-8a52-ae01ef52ff10" />
<img width="2485" height="728" alt="image" src="https://github.com/user-attachments/assets/294e79e6-c870-45ed-a870-04b80866f0d3" />
<img width="2496" height="822" alt="image" src="https://github.com/user-attachments/assets/c4b4f893-40c8-42fd-adc5-0654fe482f21" />
<img width="2513" height="978" alt="image" src="https://github.com/user-attachments/assets/5983cc0b-04d8-4665-9047-c22a7dbef00d" />
<img width="2500" height="1067" alt="image" src="https://github.com/user-attachments/assets/5e2777bd-5297-4ab2-99d4-a249fa6c4219" />
<img width="2500" height="1067" alt="image" src="https://github.com/user-attachments/assets/7e68add2-b441-4db8-b3f7-a5f612d1e012" />
<img width="2500" height="892" alt="image" src="https://github.com/user-attachments/assets/95862634-6e0e-4935-87af-aedf2a0b4df4" />
<img width="2500" height="892" alt="image" src="https://github.com/user-attachments/assets/0e7b3e1a-e323-4333-9efa-0dbd9ce447a7" />
<img width="2467" height="898" alt="image" src="https://github.com/user-attachments/assets/709a4bc9-e3c2-41f5-b0ca-997c487b2328" />
<img width="2507" height="910" alt="image" src="https://github.com/user-attachments/assets/3658e288-6c8a-4dde-ae13-caf5212aa5b5" />
<img width="2510" height="925" alt="image" src="https://github.com/user-attachments/assets/9561b0f7-be4d-44b7-914d-8803f46abbec" />
<img width="1041" height="615" alt="image" src="https://github.com/user-attachments/assets/d6941c47-7369-451f-abe7-96351b706a26" />
<img width="1492" height="1163" alt="image" src="https://github.com/user-attachments/assets/b1099afb-06dd-4d42-b30a-dbf27f285523" />
<img width="1075" height="657" alt="image" src="https://github.com/user-attachments/assets/b92cc91b-54c8-4097-808d-d52beb645ec0" />
<img width="1051" height="712" alt="image" src="https://github.com/user-attachments/assets/01da327a-2114-4168-9672-bf6b2f715f88" />
<img width="2512" height="1438" alt="image" src="https://github.com/user-attachments/assets/be9cd73c-ca4e-4b7b-b4ef-719a1aa4fa22" />
<img width="2212" height="840" alt="image" src="https://github.com/user-attachments/assets/d618f49e-1ccf-4eb8-8a49-7e895d2cb324" />
<img width="2122" height="665" alt="image" src="https://github.com/user-attachments/assets/26b25e24-9c31-4b82-9ceb-0a0915811381" />
<img width="2510" height="790" alt="image" src="https://github.com/user-attachments/assets/09d3f385-1943-4b01-96b9-6184dabc8a57" />
<img width="2512" height="910" alt="image" src="https://github.com/user-attachments/assets/af0f57e8-a337-4814-9950-b9611ee8fffa" />
<img width="875" height="1375" alt="image" src="https://github.com/user-attachments/assets/54cc831e-d4be-4196-8bc3-b6e037a3aea5" />
<img width="1465" height="172" alt="image" src="https://github.com/user-attachments/assets/12d3b656-0eeb-465a-8cdb-b0417df80281" />
<img width="1577" height="415" alt="image" src="https://github.com/user-attachments/assets/54efc516-e8fc-4d8b-9b8a-3eb586da37db" />
<img width="2500" height="1352" alt="image" src="https://github.com/user-attachments/assets/9cb1c635-3298-4e27-9d9b-1ac27bf62825" />
<img width="2508" height="1377" alt="image" src="https://github.com/user-attachments/assets/9974a01f-5cb6-429f-9adc-e7c11c8ae4cd" />
















