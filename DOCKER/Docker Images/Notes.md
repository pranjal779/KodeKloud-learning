# How to create my own images?
1. Os - Ubuntu
2. Update apt repo
3. Install dependencies using apt
4. Install Python dependencies using pip
5. Copy source code to /opt folder
6. Run the web server using "flask" command
7. <img width="2395" height="961" alt="image" src="https://github.com/user-attachments/assets/bd69e8ea-ab9a-48b2-9cd8-0ae5beef4768" />
8. <img width="2363" height="1187" alt="image" src="https://github.com/user-attachments/assets/59b51782-e7d3-4ef2-a0df-dc245e7bb706" />
9. <img width="942" height="177" alt="image" src="https://github.com/user-attachments/assets/2274e9fd-6802-48dc-b524-e287c5877b8e" />
10. <img width="1876" height="1263" alt="image" src="https://github.com/user-attachments/assets/ca0c547f-5214-4c6d-94de-db03d8e62861" />
11. <img width="1842" height="1258" alt="image" src="https://github.com/user-attachments/assets/c0b53b14-4ef4-4d5f-8b30-370902ba3903" />
12. <img width="1770" height="1193" alt="image" src="https://github.com/user-attachments/assets/0a35a171-56f3-4ee6-ba54-4d923228a819" />
13. <img width="2351" height="1212" alt="image" src="https://github.com/user-attachments/assets/ecb388d0-236d-4c2e-a0d6-8c4b684c94b7" />
14. <img width="2227" height="865" alt="image" src="https://github.com/user-attachments/assets/314ac707-c00a-4c14-acfe-50a759d091b7" />
15. <img width="2345" height="898" alt="image" src="https://github.com/user-attachments/assets/3fd29054-aab0-4bcb-b4ca-8c9945925474" />

# Layered Architecture
1. <img width="2286" height="940" alt="image" src="https://github.com/user-attachments/assets/4dfdfe8f-b1a4-487f-ba3c-6120b2becbca" />
2. <img width="2387" height="912" alt="image" src="https://github.com/user-attachments/assets/a40b0c0d-57ce-420b-8238-8dc046a6e8cc" />
3. <img width="2376" height="1286" alt="image" src="https://github.com/user-attachments/assets/f51e6653-5bc1-459e-89f6-21acea4b95d8" />
4. <img width="1792" height="1131" alt="image" src="https://github.com/user-attachments/assets/36151e72-ef17-4df6-b7fe-63cc5bcbe91d" />
5. <img width="1792" height="1131" alt="image" src="https://github.com/user-attachments/assets/4cd6a019-e22c-4e27-b287-3aa787f7d114" /> 

# failure
1. <img width="2385" height="907" alt="image" src="https://github.com/user-attachments/assets/21fc604b-b218-41b5-9c94-9ed49029d75d" />



# Demo - Creating a new Docker Image
1. <img width="1813" height="1076" alt="image" src="https://github.com/user-attachments/assets/773e81f5-659d-4167-a709-8dbd7d3feb1f" />
2. docker ps
3. docker run -it ubuntu bash
4. follow the repo instructions
5. apt-get install -y python
6. apt-get install python-pip
7. pip install flask
8. cat > /opt/app.py
9. <img width="1285" height="272" alt="image" src="https://github.com/user-attachments/assets/58047343-924a-4d5d-a037-b73eb5e0df0b" />
10. <img width="1782" height="956" alt="image" src="https://github.com/user-attachments/assets/4dde3846-0370-4b0d-84eb-270e2e605c3c" />
11. How do you dockerise it
12. write down all the steps you did manually in file
13. <img width="1660" height="1267" alt="image" src="https://github.com/user-attachments/assets/57c1668a-7e61-4cb3-b2a2-6b436d1c5a98" />
14. mkdir my-simpe-webapp
15. cat > Dockerfile

16. example of Docker file:
<img width="2005" height="673" alt="image" src="https://github.com/user-attachments/assets/b1e98728-0772-4e14-a166-6b6d84bf42ee" /> 

```sh 
FROM ubuntu

RUN apt-get update
RUN apt-get install -y python python-pip
RUN pip install flask

COPY app.py /opt/app.py

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0
```


17. <img width="1182" height="197" alt="image" src="https://github.com/user-attachments/assets/31398eaf-0b18-4537-8d29-0d9632921cbc" /> 
<img width="1262" height="1201" alt="image" src="https://github.com/user-attachments/assets/971e2152-b525-4e64-aec6-adfb559204f9" />

18. docker build .
19. docker build . -t my-simple-webapp
20. <img width="2313" height="1087" alt="image" src="https://github.com/user-attachments/assets/180479ee-7f92-4a30-88bd-95b4f3cfd3dd" />
21. docker images
22. docker run my-simple-webapp
23. <img width="1383" height="892" alt="image" src="https://github.com/user-attachments/assets/b6bd7c17-d7e6-4c7b-a9dd-70c8b134a088" />
24. <img width="1572" height="980" alt="image" src="https://github.com/user-attachments/assets/e394ac66-8060-44ff-94dd-84f78f80e225" />
25. How to push it to docker HUB and make is available
26. <img width="1383" height="667" alt="image" src="https://github.com/user-attachments/assets/9a2b7287-5e5d-4223-bece-f4ca4132c869" />
27. <img width="1252" height="321" alt="image" src="https://github.com/user-attachments/assets/6633e630-4afc-4171-9c1c-d71acbacedbb" />
28. You need to tag it with your account name to be able to push it in Docker HUB
29. <img width="2087" height="1142" alt="image" src="https://github.com/user-attachments/assets/b56af2cf-336c-4c32-ab37-237495442c43" />
30. <img width="1471" height="931" alt="image" src="https://github.com/user-attachments/assets/0e90b163-df51-4de7-a062-047494544683" />
31. <img width="1453" height="687" alt="image" src="https://github.com/user-attachments/assets/1443bba8-dac2-48ce-a6cb-ad93bfe7f22d" />
32. <img width="1557" height="690" alt="image" src="https://github.com/user-attachments/assets/c5a26c3c-bdad-49a3-a6ec-813332126686" />
33. <img width="1362" height="613" alt="image" src="https://github.com/user-attachments/assets/203fe260-b980-41c2-8c17-bf6609fb108e" />
34. <img width="1685" height="501" alt="image" src="https://github.com/user-attachments/assets/4d2e20cf-559a-4296-9cde-2eaa16f428a4" />
