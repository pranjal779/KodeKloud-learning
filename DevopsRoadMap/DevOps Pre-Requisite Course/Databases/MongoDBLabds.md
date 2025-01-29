![image](https://github.com/user-attachments/assets/222f1709-724f-4891-b9d6-5dc2fd54db30)

![image](https://github.com/user-attachments/assets/8946bb5c-5896-464e-8685-b2aa0f56040e)

![image](https://github.com/user-attachments/assets/59b5e996-adab-478f-97e4-5253f8d6c5f6)

![image](https://github.com/user-attachments/assets/f00e15a3-6f08-4d82-b44c-18c9ad06c150)

![image](https://github.com/user-attachments/assets/a1186774-39cd-4de3-8fb1-d35a3233c57e)

## Install MongoDB
![image](https://github.com/user-attachments/assets/2baa20ed-295c-44aa-b742-1421e5aedb7d)

![image](https://github.com/user-attachments/assets/e453d256-57e1-45c2-9c21-f1fd2333b228)

$ssh app01
thor@app01 ~$ sudo nano /etc/yum.repos.d/mongodb-org-8.0.repo
```
[mongodb-org-8.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/9/mongodb-org/8.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://pgp.mongodb.com/server-8.0.asc
```

sudo yum install -y mongodb-org


![image](https://github.com/user-attachments/assets/f8dbc89d-332a-440c-b255-e7601c1d0e1a)

![image](https://github.com/user-attachments/assets/ad9aaf40-2d82-46ee-b8ef-0d648ccb6da7)

thor@app01 ~$ sudo systemctl start mongod

thor@app01 ~$ mongod --version
db version v8.0.4
Build Info: {
    "version": "8.0.4",
    "gitVersion": "bc35ab4305d9920d9d0491c1c9ef9b72383d31f9",
    "openSSLVersion": "OpenSSL 3.2.2 4 Jun 2024",
    "modules": [],
    "allocator": "tcmalloc-google",
    "environment": {
        "distmod": "rhel93",
        "distarch": "x86_64",
        "target_arch": "x86_64"
    }
}
thor@app01 ~$ 

![image](https://github.com/user-attachments/assets/166e7401-f35b-4e78-92ed-0cfa8d524bb4)
