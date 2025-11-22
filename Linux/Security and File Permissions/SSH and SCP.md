# SSH

```sh
ssh <hostname or IP Address>
ssh <user>@<hostname OR IP Address>
ssh -l <user> <hostname OR IP Address>

ssh devapp01
```
<img width="1922" height="1000" alt="image" src="https://github.com/user-attachments/assets/c3c2451a-bad3-4193-b43d-4eab7ae1a930" />

# Password-less SSH

key Pair = Private Key + Public Key

<img width="1752" height="752" alt="image" src="https://github.com/user-attachments/assets/72123acd-a6cb-47b9-be00-daada99f5410" />

```sh
ssh-keygen -t rsa
```
<img width="1971" height="1078" alt="image" src="https://github.com/user-attachments/assets/316358ea-ec68-4fed-a914-05415731b27f" />


```sh
ssh-copy-id bob@devapp01
ssh devapp01
```
<img width="1876" height="975" alt="image" src="https://github.com/user-attachments/assets/c403b457-21c6-47c5-b313-8e589e048eed" />


```sh
cat /home/bob/.ssh/authorized_keys
```
<img width="1878" height="626" alt="image" src="https://github.com/user-attachments/assets/9a086052-e9e7-4271-8e49-3b39fac39fcb" />


# SCP

**CP coomand is for copy files and directories**

```sh
scp /home/bob/caleston-code.tar.gz devapp01:/home/bob

scp /home/bob/caleston-code.tar.gz devapp01:/root

scp -pr /home/bob/media/ devapp01:/home/bob

scp -r # copy directories instead of files

scp -p # to preserve the ownership and permissions of the file and directories
```
<img width="1953" height="1047" alt="image" src="https://github.com/user-attachments/assets/341875cf-b36d-4247-825e-1435ed210c68" />
