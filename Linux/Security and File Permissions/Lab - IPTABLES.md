<img width="1832" height="842" alt="image" src="https://github.com/user-attachments/assets/f25963d5-b9b3-4fc5-838a-b3fca1a8be2e" />
<img width="1982" height="840" alt="image" src="https://github.com/user-attachments/assets/69232d6a-9bb7-4e63-ba6a-548de8ec6aa4" />
<img width="1002" height="817" alt="image" src="https://github.com/user-attachments/assets/07f2a2b7-2f1a-41ee-b878-a8aa549d7c4c" />
<img width="933" height="1041" alt="image" src="https://github.com/user-attachments/assets/9773ebd1-78e3-485c-9536-aa733749baf1" />
<img width="1102" height="885" alt="image" src="https://github.com/user-attachments/assets/8d260389-bca6-41bf-ac82-626adead3701" />
<img width="1017" height="387" alt="image" src="https://github.com/user-attachments/assets/694a2088-acb8-4ab1-baa3-a85b6adb0804" />
<img width="1013" height="1020" alt="image" src="https://github.com/user-attachments/assets/b0009c1c-855f-4049-91d7-4b084c1727bc" />
<img width="1083" height="1323" alt="image" src="https://github.com/user-attachments/assets/0b01c246-f9c6-48f1-ad10-a0d10dec7ad8" />
<img width="1136" height="1303" alt="image" src="https://github.com/user-attachments/assets/536b1f77-24d8-4767-b26a-4e107b448e2d" />
<img width="1220" height="1337" alt="image" src="https://github.com/user-attachments/assets/502e15a3-7c1a-40c4-91e9-bc731fbd205b" />
<img width="1103" height="1236" alt="image" src="https://github.com/user-attachments/assets/fa0a7107-f0b6-41f8-a136-8118ee84d445" />
<img width="727" height="591" alt="image" src="https://github.com/user-attachments/assets/1dc4f777-d29a-4368-9f9d-db26eb06b506" />

```
Access the devapp01 server:

Execute the following command to SSH into the server:
 ssh bob@devapp01
When prompted, enter the password: caleston123.
Switch to the root shell:

To avoid repeated sudo prompts, execute the following command:
 sudo -s
When prompted, enter the password: caleston123.
Update the package list:

Run the command to update the package list:
 apt update
Install iptables:

Execute the following command to install iptables:
 apt install iptables
(Optional) Verify the installation:

You may verify the installation by checking the version of iptables:
 iptables --version
Repeat the same steps for the devdb01 server:

Exit the root shell or SSH session as needed:
 exit
SSH into the devdb01 server:
 ssh bob@devdb01
Switch to the root shell:
 sudo -s
Update the package list:
 apt update
Install iptables:
 apt install iptables
Optionally verify the installation:
 iptables --version
```

<img width="1107" height="861" alt="image" src="https://github.com/user-attachments/assets/37083252-b711-46e1-a266-b19d70039cc5" />

<img width="1073" height="845" alt="image" src="https://github.com/user-attachments/assets/b6b29820-dd23-4038-949c-8d66100c7471" />

<img width="1997" height="1022" alt="image" src="https://github.com/user-attachments/assets/2a2b3899-84e8-4d4b-97a9-de04fc560df3" />
<img width="1292" height="450" alt="image" src="https://github.com/user-attachments/assets/bd828115-ac87-47f3-a515-30181651c90f" />
<img width="1077" height="797" alt="image" src="https://github.com/user-attachments/assets/3369c566-b888-4ba8-89b6-321e49ebd552" />

<img width="1125" height="1037" alt="image" src="https://github.com/user-attachments/assets/1f24871e-104c-4679-b640-d516145722d8" />

<img width="1112" height="585" alt="image" src="https://github.com/user-attachments/assets/5f194e27-b259-450f-a47b-37e1225cf887" />

<img width="2427" height="971" alt="image" src="https://github.com/user-attachments/assets/c9f81f1b-3ca7-4194-a582-b9408479f3a0" />

```
SSH into devapp01 as the user bob:

ssh bob@devapp01
# Enter password: caleston123
Switch to the root shell to avoid entering the password for every command:

sudo -s
# Enter password: caleston123
Add the iptables rule to allow SSH from Bob's Laptop:

iptables -A INPUT -p tcp -s 172.16.238.187 --dport 22 -j ACCEPT
Add the iptables rule to allow HTTP from Bob's Laptop:

iptables -A INPUT -p tcp -s 172.16.238.187 --dport 80 -j ACCEPT
(Optional) Verify the rules were added:

iptables -L -v
```

<img width="2481" height="1143" alt="image" src="https://github.com/user-attachments/assets/59c57751-3ae1-45fc-8628-be7a566b07a3" />
<img width="1071" height="877" alt="image" src="https://github.com/user-attachments/assets/6210d1e7-9479-45c4-82aa-eede9efa7eef" />
<img width="1077" height="597" alt="image" src="https://github.com/user-attachments/assets/9e8ff5d0-7b79-49bd-8784-3abfe2f20b6f" />
<img width="1037" height="752" alt="image" src="https://github.com/user-attachments/assets/b958f54f-7303-4612-8c58-14148a26762f" />
<img width="2207" height="1035" alt="image" src="https://github.com/user-attachments/assets/08712d2b-1658-425b-b988-bfc0af30593b" />

```
SSH into devapp01 as the user bob:

ssh bob@devapp01
# Enter password: caleston123
Switch to the root shell to avoid entering the password repeatedly:

sudo -s
# Enter password: caleston123
Add the DROP rule at the end of the INPUT chain:

iptables -A INPUT -j DROP
(Optional) Verify the rules to ensure the DROP rule is at the bottom, after your ACCEPT rules:

iptables -L -v --line-numbers
````
