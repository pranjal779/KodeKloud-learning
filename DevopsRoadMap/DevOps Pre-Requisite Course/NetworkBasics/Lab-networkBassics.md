![image](https://github.com/user-attachments/assets/306f8bf1-349c-4bb0-acd6-1cda8faf4fdb)

![image](https://github.com/user-attachments/assets/6e16e9c9-6cb7-49d6-8fda-7080203347bf)

![image](https://github.com/user-attachments/assets/e44576bc-0fe9-4711-88e0-7d8308a45e44)

![image](https://github.com/user-attachments/assets/c8870c68-b6eb-4efc-a95d-1aab1c3e8719)

![image](https://github.com/user-attachments/assets/f3b6c4cf-fa53-4406-bb11-3c4eaae007d4)

![image](https://github.com/user-attachments/assets/2d85f65f-8456-4a60-9944-f70670c060f3)

![image](https://github.com/user-attachments/assets/f93bfb45-01b0-4c8b-9744-0ecbc3ea4768)

![image](https://github.com/user-attachments/assets/4c535caa-0679-4f89-b21d-a89e3680212a)

![image](https://github.com/user-attachments/assets/bf2805db-497e-4ddc-98f6-c8deaaf41a18)

# Hint:
![image](https://github.com/user-attachments/assets/a047e408-23d0-404c-915a-4197681a45db)

```sh

ssh app01
thor@app01 ~$ sudo ip addr add 172.16.238.15/24 dev eth0

![image](https://github.com/user-attachments/assets/383cb5c3-af8c-4450-860c-2dc80e12b377)

![image](https://github.com/user-attachments/assets/477f6f02-ca6e-4225-9a3a-1508ff5ae750)

```sh
thor@app01 ~$ exit ssh app01
logout
-bash: exit: ssh: numeric argument required
Connection to app01 closed.
thor@jumphost ~$ 
```

![image](https://github.com/user-attachments/assets/9617ca8f-4136-4f96-92d6-35eb24647ab2)

![image](https://github.com/user-attachments/assets/68037be0-1f20-49b5-8129-b66d457e40d5)

![image](https://github.com/user-attachments/assets/76aaf473-5db7-4d51-8d48-d14cce0ed983)

![image](https://github.com/user-attachments/assets/577e11f1-068f-4a9f-994c-82269c0ddb12)

![image](https://github.com/user-attachments/assets/c7cc143f-8276-4c23-a4e4-cd28b8608f39)

![image](https://github.com/user-attachments/assets/aa8256e3-dbc5-470d-8006-5764fe403ca1)


```sh
thor@jumphost ~$ ssh jump_host
The authenticity of host 'jump_host (172.16.238.10)' can't be established.
ED25519 key fingerprint is SHA256:nYp8rIeI8BHIz3+zJMIYve3XqLhrdr9CGV7glJuucV4.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'jump_host' (ED25519) to the list of known hosts.
thor@jump_host's password: 
Permission denied, please try again.
thor@jump_host's password: 

thor@jumphost ~$ ssh app01
Last login: Mon Dec 30 06:22:30 2024 from 172.16.238.10
thor@app01 ~$ ssh app03
ssh: connect to host app03 port 22: No route to host
thor@app01 ~$ exit
logout
Connection to app01 closed.
thor@jumphost ~$
```

It looks like you are experiencing two issues:

Password Denied for jump_host: Ensure that you are using the correct password for jump_host. If it's incorrect, you won't be able to establish a connection.
No Route to Host for app03: This indicates a network issue. Ensure that app03 is reachable from app01. You can check network connectivity using ping app03 from app01.
Here are the steps to troubleshoot and resolve these issues:

Check Password for jump_host: Verify that you have the correct password and retry.

Check Network Connectivity:

sh
ssh app01
ping app03
If ping fails, there might be a network configuration issue preventing access to app03.

Verify SSH Service on app03:

sudo systemctl status ssh
Ensure the SSH service is running on app03.

Firewall Settings:

sudo ufw status
Ensure port 22 is open on app03.

Check /etc/hosts: Ensure the hostnames for app03 and app04 are correctly defined.

If you encounter specific error messages during these steps, please share them for further assistance.
