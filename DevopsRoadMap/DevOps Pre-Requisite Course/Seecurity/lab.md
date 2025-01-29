![image](https://github.com/user-attachments/assets/3d025160-500d-4848-8f07-e50ac6625f1d)

![image](https://github.com/user-attachments/assets/a6aba808-f0bd-4e6c-bfa8-9b5df18d99fc)

![image](https://github.com/user-attachments/assets/382506fb-8b85-4d5c-94f8-3f05bbdf53f3)

![image](https://github.com/user-attachments/assets/fbe10322-ec52-4c02-969c-21d53fbd1de7)

![image](https://github.com/user-attachments/assets/922e2612-6e62-4aef-917f-9606264a2060)

![image](https://github.com/user-attachments/assets/545e5176-50b5-4dcf-8fa5-e1db224d9575)

![image](https://github.com/user-attachments/assets/15757de2-7e32-4552-8046-1b6253efc8d6)

![image](https://github.com/user-attachments/assets/221f757f-3980-40cb-ae71-43bdfd16012c)

![image](https://github.com/user-attachments/assets/f2654406-dcb5-4748-87ff-7002f21eee48)

![image](https://github.com/user-attachments/assets/3ebe5521-29a7-49ee-a109-c05c02023dd8)

```sh
thor@host01 ~$ pwd
/home/thor
thor@host01 ~$ ssh-keygeen -t rsa
-bash: ssh-keygeen: command not found
thor@host01 ~$ ssh-keygen -t rsa 
Generating public/private rsa key pair.
Enter file in which to save the key (/home/thor/.ssh/id_rsa): 
/home/thor/.ssh/id_rsa already exists.
Overwrite (y/n)? n
thor@host01 ~$ ssh-keygen -t rsa 
Generating public/private rsa key pair.
Enter file in which to save the key (/home/thor/.ssh/id_rsa): /home/thor/.ssh/mykey
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/thor/.ssh/mykey
Your public key has been saved in /home/thor/.ssh/mykey.pub
The key fingerprint is:
SHA256:tsHzNnrU4yo9V0BXLf9nf1qtvy4jNY3pHi7BXbD4q6k thor@host01.mycorp.org
The key's randomart image is:
+---[RSA 3072]----+
|               .o|
|            ..o .|
|           ...oo |
|       .   ... ..|
|        S ..o.= .|
|       . =.ooB..=|
|        .o+.++o.=|
|        .o++==.oo|
|        .Eo*=o*=+|
+----[SHA256]-----+
thor@host01 ~$
```

![image](https://github.com/user-attachments/assets/38e5aaa3-8073-44e4-ae3f-152ff5ed00f3)

![image](https://github.com/user-attachments/assets/1c368747-4a2e-4fa1-b9d0-5a52d65d2463)

```sh
thor@host01 ~$ ssh-copy-id -i ~/.ssh/mykey.pub thor@app01
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/thor/.ssh/mykey.pub"
The authenticity of host 'app01 (172.16.238.15)' can't be established.
ED25519 key fingerprint is SHA256:Wd0O6ZSsJ8OBw??????????????XHIvJ6GLO5Q.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'thor@app01'"
and check to make sure that only the key(s) you wanted were added.

thor@host01 ~$
```

![image](https://github.com/user-attachments/assets/8c73fdc8-69f5-45b4-95db-ead2f409083f)

![image](https://github.com/user-attachments/assets/8ce599ac-4045-4e26-ac5e-4f51aea3d902)

![image](https://github.com/user-attachments/assets/a622dece-c06a-4828-b962-187136f527ed)

```sh
thor@app01 /etc/httpd/csr$ sudo openssl req -new -newkey rsa:2048 -nodes -keyout app01.key -out app01.csr
......+.+...+..+.............+.....+.+...........+...+++++++++++++++++++++++++++++++++++++++*.+.......+......+.....+.+.........+.....+.........+...+...+....+++++++++++++++++++++++++++++++++++++++*.+......+.........+...........+.+........+...+...+.+...............+......+............+...........+.+.....+.+...+..+......................+.....+.......+......+........+.......+...+......+.....+...+..........+..+......+...+.+.........+.....+.......+..++++++
..+......+......+...+...+..+......+....+...+..+................+......+...........+....+......+...+.........+..+++++++++++++++++++++++++++++++++++++++*..+............+.......+......+.....+...+....+..+......+....+...+......+..+...+.+......+...+.....+.+......+.........+++++++++++++++++++++++++++++++++++++++*............+...+..+.+.....+...................+.....+.........+....+........+.......+..++++++
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [XX]:SG
State or Province Name (full name) []:Capital Tower
Locality Name (eg, city) [Default City]:CT
Organization Name (eg, company) [Default Company Ltd]:KodeKloud
Organizational Unit Name (eg, section) []:Education
Common Name (eg, your name or your server's hostname) []:app01.com
Email Address []:admin@kodekloud.com

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
thor@app01 /etc/httpd/csr$
```

![image](https://github.com/user-attachments/assets/806e5294-50a3-4be9-bcb2-bcec9364c4c7)

![image](https://github.com/user-attachments/assets/c8e7c92d-1cb7-4e2b-94d9-b052b28ab2d8)


```
thor@app01 /etc/httpd$ ls
certs  conf  conf.d  conf.modules.d  csr  logs  modules  run  state
thor@app01 /etc/httpd/certs$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout app01.key -out app01.crt
...+......+......+.......+..+....+.................+++++++++++++++++++++++++++++++++++++++*...+..+......+.........+....+++++++++++++++++++++++++++++++++++++++*....+.+..+...+....+...............+..+...+......+.........+...+.......+.....+...+...+.+...+........+...+.......+.....+.........+...+.......+...+...+.....+.........+.+..+.+......+.........+..+...+.........+...+...+....+......+...............+..++++++
.+....+.....................+.........+......+..+......+.+...+++++++++++++++++++++++++++++++++++++++*....+...+++++++++++++++++++++++++++++++++++++++*....+...+........+....+...+..+.....................+..........+.....+.......+..+.+......+.....+......+...+.+...+.....+...+....+...+..+......+.......+............+........+...++++++
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [XX]:SG
State or Province Name (full name) []:Capital Tower
Locality Name (eg, city) [Default City]:CT
Organization Name (eg, company) [Default Company Ltd]:KodeKloud
Organizational Unit Name (eg, section) []:Education
Common Name (eg, your name or your server's hostname) []:app01.com
Email Address []:admin@kodekloud.com
thor@app01 /etc/httpd/certs$
```

![image](https://github.com/user-attachments/assets/9e25044d-e4f1-498e-84ff-3ffd48e19547)

