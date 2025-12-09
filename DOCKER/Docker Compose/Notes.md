# Docker Compose
<img width="1898" height="1160" alt="image" src="https://github.com/user-attachments/assets/d0fe6115-0a8d-4fb6-a572-679f8ae4d9ef" />

<img width="1963" height="1115" alt="image" src="https://github.com/user-attachments/assets/b0eef5d1-f6b3-4a07-a0c3-2bcfc0d4bfb5" />
<img width="1630" height="1017" alt="image" src="https://github.com/user-attachments/assets/232c1964-cb51-43ca-a468-61ec9a67b8a0" />
<img width="1872" height="1012" alt="image" src="https://github.com/user-attachments/assets/a66d15c9-5bce-41fd-b37a-4ce7c2af9b72" />
<img width="1840" height="1007" alt="image" src="https://github.com/user-attachments/assets/be281bac-3baa-4ca7-9555-2e2b5dacc25a" />
<img width="2051" height="1043" alt="image" src="https://github.com/user-attachments/assets/9c71e4ee-0715-4d02-91fb-b2fccae8fec5" />
<img width="1987" height="1055" alt="image" src="https://github.com/user-attachments/assets/63d5b8c3-af42-480f-a323-8efad1d22264" />

**we have not linked all the servers**

# docker run --links
**To link 2 container togather**

<img width="1983" height="1110" alt="image" src="https://github.com/user-attachments/assets/613f94f1-2899-4033-a1a3-5f09e543140f" />

```sh

docker run -d --name=redis redis

docker run -d --name=db postgres
docker run -d --name=vote -p 5000:80 --link redis:redis voting-app
docker run -d --name=result -p 5001:80 result-app
docker run -d --name=worker worker

```

<img width="2006" height="1172" alt="image" src="https://github.com/user-attachments/assets/afbfc914-ed13-440a-a895-176dd50c6437" />

```sh

docker run -d --name=redis redis

docker run -d --name=db postgres
docker run -d --name=vote -p 5000:80 --link redis:redis voting-app
docker run -d --name=result -p 5001:80 --link db:db result-app
docker run -d --name=worker worker

```

<img width="2023" height="1075" alt="image" src="https://github.com/user-attachments/assets/a31c027c-75cb-4297-a0ea-1fb7f5af3e25" />
<img width="1982" height="1030" alt="image" src="https://github.com/user-attachments/assets/ecba41e8-a497-4971-a8bd-9e76faeeda57" />
<img width="2052" height="1157" alt="image" src="https://github.com/user-attachments/assets/c542106d-3ed0-499c-a978-760a3457a438" />

**There are now Advanced and better way to link now, we can achieve linking in more updated advanced ways**

# Docker compose
<img width="1927" height="1180" alt="image" src="https://github.com/user-attachments/assets/3d796e3c-6d7a-4e4a-9c7b-4d80f3d3044f" />
<img width="1916" height="1122" alt="image" src="https://github.com/user-attachments/assets/63fb910c-42c5-4917-ba87-5ba2be26d2e9" />
<img width="1892" height="1136" alt="image" src="https://github.com/user-attachments/assets/9da4ea86-6e97-43e6-b25f-889e8703dd00" />


# Docker compose - build
<img width="1193" height="1136" alt="image" src="https://github.com/user-attachments/assets/05d2caca-d7e4-4275-a418-7e9ad126c538" />

<img width="1657" height="1107" alt="image" src="https://github.com/user-attachments/assets/1bbccb4d-932f-4cba-9f6d-33b5734cf83c" />
<img width="2032" height="1115" alt="image" src="https://github.com/user-attachments/assets/63ab03ff-2702-44c0-aa4d-9ca9b0e915e5" />
<img width="1981" height="1080" alt="image" src="https://github.com/user-attachments/assets/77f9cf76-fca7-4d4d-9837-7b5635d7b17e" />


# Docker compose - version
## Version 1:
<img width="1497" height="1176" alt="image" src="https://github.com/user-attachments/assets/2c17eb22-9003-4610-9256-c63a725cb115" />

## Version 2:
<img width="1437" height="1172" alt="image" src="https://github.com/user-attachments/assets/46a847a7-3de8-4a71-a50f-90e1e00e4874" />
<img width="1447" height="1177" alt="image" src="https://github.com/user-attachments/assets/2c90eda9-2ea4-4f3b-a595-0991352d5e18" />

**there is difference in networking**
**You can remove the links code from the file in Version 2 and up, Docker will automatically create them**
<img width="1458" height="1157" alt="image" src="https://github.com/user-attachments/assets/44b71c94-4de8-4d89-bdf5-9e0bff7a4496" />
### depends_on:
<img width="1547" height="1150" alt="image" src="https://github.com/user-attachments/assets/049c27cb-6303-44f5-9f36-c686cde19984" />


## Version 3:
**Version 3 comes with support for Docker Swarm**
<img width="1926" height="1212" alt="image" src="https://github.com/user-attachments/assets/dafbf5c4-7462-47d0-8128-53e4117c5db5" />
## Refer to the Documentation for Version 3
**Also check out the topic Docker Stacks**


# Networks
<img width="1987" height="1151" alt="image" src="https://github.com/user-attachments/assets/7c3ecb63-5023-4954-b6ab-834787986636" />
<img width="1972" height="1151" alt="image" src="https://github.com/user-attachments/assets/7d921b95-da06-4df2-b63f-668e7fab2d73" />
<img width="1991" height="1140" alt="image" src="https://github.com/user-attachments/assets/6cf07a2f-7c0f-412d-9036-5682f78061a6" />
