<img width="1317" height="993" alt="image" src="https://github.com/user-attachments/assets/5411c76c-672c-4dfd-a73c-ac68f3e178cb" />
<img width="1868" height="787" alt="image" src="https://github.com/user-attachments/assets/b20b31e5-98be-49aa-9080-c3cfe2a31f84" />
<img width="1017" height="877" alt="image" src="https://github.com/user-attachments/assets/482a234b-c42f-4603-8b26-c10a5b1bf073" />
<img width="958" height="628" alt="image" src="https://github.com/user-attachments/assets/eab4d85a-7fd7-4582-a3ee-779fdd83086c" />
<img width="1017" height="676" alt="image" src="https://github.com/user-attachments/assets/962a5647-bc0d-4ff9-a439-000f482d3489" />
<img width="657" height="193" alt="image" src="https://github.com/user-attachments/assets/94583e05-7b97-469c-8f5e-794246be7d35" />



The command scp caleston-code.tar.gz bob@devapp01 is a valid usage of scp for copying a file to a remote server. You do not strictly need to include :~/ at the end. 
Explanation: 

• caleston-code.tar.gz: This is the source file on your local machine that you want to copy. 
• bob@devapp01: This specifies the remote user (bob) and the remote host (devapp01) where the file will be copied. 

Default Behavior: 
When you omit the destination path after bob@devapp01:, scp defaults to copying the file to the remote user's home directory. So, in your example, caleston-code.tar.gz will be copied to /home/bob/caleston-code.tar.gz on devapp01. 
When to specify the path (e.g., :~/ or /path/to/directory/): 
You would explicitly specify the destination path if you want to copy the file to a location other than the remote user's home directory. 

• bob@devapp01:~/: This explicitly tells scp to copy the file to the home directory of bob on devapp01. This is redundant if the default behavior is what you want, but it can be used for clarity or consistency in scripts. 
• bob@devapp01:/var/www/html/: This would copy the file to the /var/www/html/ directory on devapp01 (assuming bob has the necessary permissions). 

In summary: 
Your command scp caleston-code.tar.gz bob@devapp01 is correct and will copy the file to bob's home directory on devapp01. Adding :~/ is optional and only serves to explicitly state the default behavior. 

<img width="1018" height="743" alt="image" src="https://github.com/user-attachments/assets/81f03e29-619f-4ec6-98ab-81c67ff84be5" />
<img width="1941" height="902" alt="image" src="https://github.com/user-attachments/assets/8480366f-0931-4a32-af52-0f802feafc5a" />
<img width="1192" height="525" alt="image" src="https://github.com/user-attachments/assets/c6488654-2648-468b-b365-13de41c5572a" />
<img width="2251" height="822" alt="image" src="https://github.com/user-attachments/assets/a266e7c2-4629-4f09-a6c7-53cc77a93af8" />
<img width="1037" height="803" alt="image" src="https://github.com/user-attachments/assets/e7f10ab6-bb29-45ef-b77f-a0c8fd342bc8" />
<img width="1047" height="405" alt="image" src="https://github.com/user-attachments/assets/ab50bfc0-3a08-44a0-ba16-dbf3274242a9" />
<img width="1032" height="830" alt="image" src="https://github.com/user-attachments/assets/2a90d49a-6aa8-496e-88ba-d0fe99169717" />
<img width="2297" height="1092" alt="image" src="https://github.com/user-attachments/assets/cf03922f-2df7-4fe7-8e50-0ab38174b4cc" />
<img width="848" height="248" alt="image" src="https://github.com/user-attachments/assets/4e5edbea-6d65-4511-9ddb-de81ece1766a" />
<img width="756" height="392" alt="image" src="https://github.com/user-attachments/assets/96826f7a-5083-47b5-a649-b30c982f3e1a" />
<img width="1988" height="1148" alt="image" src="https://github.com/user-attachments/assets/19c6faf1-06ea-4cbf-9693-a05200b65695" />

```
bob@devapp01:~$ ls -la
total 1472
drwxr-xr-x 1 bob  bob     4096 Nov 24 18:05 .
drwxr-xr-x 1 root root    4096 Apr 14  2020 ..
-rw------- 1 bob  bob      212 Apr 15  2020 .bash_history
drwx------ 2 bob  bob     4096 Nov 24 18:05 .cache
drwx------ 3 bob  bob     4096 Nov 24 18:05 .gnupg
-rw-r--r-- 1 root root      75 Nov 24 17:56 .vimrc
-rw-r--r-- 1 bob  bob  1473055 Nov 24 18:05 caleston-code.tar.gz
bob@devapp01:~$ ls /opt/
caleston-code
bob@devapp01:~$ ls -la /
total 88
drwxr-xr-x    1 root   root    4096 Nov 24 18:05 .
drwxr-xr-x    1 root   root    4096 Nov 24 18:05 ..
-rwxr-xr-x    1 root   root       0 Nov 24 17:56 .dockerenv
drwxr-xr-x    1 root   root    4096 Apr 15  2020 bin
drwxr-xr-x    2 root   root    4096 Apr 24  2018 boot
drwxr-xr-x    5 root   root     380 Nov 24 17:56 dev
drwxr-xr-x    1 root   root    4096 Nov 24 17:56 etc
drwxr-xr-x    1 root   root    4096 Apr 14  2020 home
drwxr-xr-x    1 root   root    4096 Apr 15  2020 lib
drwxr-xr-x    2 root   root    4096 Feb 19  2020 lib64
drwxr-xr-x    2 root   root    4096 Feb 19  2020 media
drwxr-xr-x    2 root   root    4096 Feb 19  2020 mnt
drwxr-xr-x    1 root   root    4096 Nov 24 18:08 opt
dr-xr-xr-x 1402 root   root       0 Nov 24 17:56 proc
drwx------    1 root   root    4096 Apr 16  2020 root
drwxr-xr-x   12 root   root     340 Nov 24 18:07 run
drwxr-xr-x    1 root   root    4096 Apr 30  2020 sbin
drwxr-xr-x    2 root   root    4096 Feb 19  2020 srv
dr-xr-xr-x   13 nobody nogroup    0 Nov  1 14:53 sys
drwxrwxrwt    1 root   root    4096 Nov 24 17:56 tmp
drwxr-xr-x    1 root   root    4096 Feb 19  2020 usr
drwxr-xr-x    1 root   root    4096 Apr 30  2020 var
bob@devapp01:~$
bob@devapp01:~$ ls -la /opt/
total 16
drwxr-xr-x 1 root root 4096 Nov 24 18:08 .
drwxr-xr-x 1 root root 4096 Nov 24 18:11 ..
drwxrwxr-x 6 bob  bob  4096 Jan  8  2021 caleston-code
bob@devapp01:~$ 

```

<img width="2105" height="862" alt="image" src="https://github.com/user-attachments/assets/4b541819-760a-4798-bd0a-bf8a86bb5ad2" />

<img width="2175" height="917" alt="image" src="https://github.com/user-attachments/assets/3fe10108-9bc7-426f-8e61-b67f01733ce2" />


<img width="1055" height="582" alt="image" src="https://github.com/user-attachments/assets/46f77fe9-b95d-410e-9352-070371246c0f" />

<img width="2076" height="697" alt="image" src="https://github.com/user-attachments/assets/65ad1262-c75e-402e-8d34-19846e6e206c" />
<img width="797" height="248" alt="image" src="https://github.com/user-attachments/assets/5c338262-4cd0-48e5-bca0-008aaa99057a" />
<img width="793" height="316" alt="image" src="https://github.com/user-attachments/assets/84a6aebc-27d0-4f98-bff2-222e80f1743a" />
<img width="2213" height="740" alt="image" src="https://github.com/user-attachments/assets/3b8c5482-25f6-433e-a985-0bcd0c94598a" />

<img width="1017" height="595" alt="image" src="https://github.com/user-attachments/assets/5cfd02d5-124b-470f-9e5c-5f6c25709f51" />
<img width="2397" height="725" alt="image" src="https://github.com/user-attachments/assets/5fd4b24b-b511-4e00-96e9-46c298090f43" />
<img width="843" height="245" alt="image" src="https://github.com/user-attachments/assets/c764a3bd-ddf7-4915-80f7-1c6d0c58936b" />
<img width="1041" height="377" alt="image" src="https://github.com/user-attachments/assets/f1f5c577-cbe4-4b89-b14b-f3c0354832f7" />
<img width="2433" height="937" alt="image" src="https://github.com/user-attachments/assets/73046649-7924-4495-84ae-a5969209ef25" />
<img width="1023" height="883" alt="image" src="https://github.com/user-attachments/assets/19c2e3ab-60a8-4749-8db2-006ae46ec33e" />
<img width="937" height="502" alt="image" src="https://github.com/user-attachments/assets/c311d293-4d38-4c01-8ff5-397d513abf44" />
<img width="2148" height="1031" alt="image" src="https://github.com/user-attachments/assets/715a1392-8c1f-41ba-8f4e-d1520e2b34fd" />
<img width="2275" height="1087" alt="image" src="https://github.com/user-attachments/assets/9d52736f-e007-45ae-b952-59e2dbcdccce" />
<img width="2323" height="1137" alt="image" src="https://github.com/user-attachments/assets/7d5036f9-d542-4597-bc21-6c10710eb67f" />
<img width="1001" height="781" alt="image" src="https://github.com/user-attachments/assets/9c593821-97c0-44a4-8a80-82059ed8ba11" />
<img width="987" height="362" alt="image" src="https://github.com/user-attachments/assets/2ab8c211-45f0-4543-a72c-532e29e80fad" />
<img width="1048" height="875" alt="image" src="https://github.com/user-attachments/assets/020c41a3-afa2-4e19-925d-f8b1d922f786" />
<img width="2140" height="1182" alt="image" src="https://github.com/user-attachments/assets/c5100d51-fd38-4a1c-ad17-70c766b263cb" />
<img width="1012" height="947" alt="image" src="https://github.com/user-attachments/assets/515164c0-02e4-40bd-acc7-f2c745629950" />
<img width="2078" height="1091" alt="image" src="https://github.com/user-attachments/assets/c778b080-264f-4feb-8bdc-7d0c6f01b4ab" />
<img width="982" height="547" alt="image" src="https://github.com/user-attachments/assets/a3fd5b6c-6412-426a-ade4-b114f3c8e415" />
<img width="1012" height="452" alt="image" src="https://github.com/user-attachments/assets/b3c5c522-7d47-4da8-8101-acb7004a8d02" />
<img width="2251" height="712" alt="image" src="https://github.com/user-attachments/assets/d18c0125-cdd9-4d5e-95e1-315ea81bf299" />
<img width="1013" height="691" alt="image" src="https://github.com/user-attachments/assets/665dce78-f43e-4992-872e-3fa4645eff9b" />
<img width="777" height="300" alt="image" src="https://github.com/user-attachments/assets/40396d5e-19d2-4c36-80d2-3c00102a8db7" />
<img width="2262" height="720" alt="image" src="https://github.com/user-attachments/assets/96294cc9-0a64-4967-899c-ac893723a07c" />
<img width="2347" height="755" alt="image" src="https://github.com/user-attachments/assets/ddcebfc6-ff83-4a5c-948b-70c6b45c3279" />
<img width="1036" height="821" alt="image" src="https://github.com/user-attachments/assets/de145f75-251d-46c4-9a69-a27840596712" />
<img width="1002" height="740" alt="image" src="https://github.com/user-attachments/assets/fdbb48ab-bde0-4f6e-a855-e395cd85e60f" />
<img width="2213" height="816" alt="image" src="https://github.com/user-attachments/assets/11f28f5d-1777-420d-9cdb-4bc84b5536cf" />
<img width="1300" height="390" alt="image" src="https://github.com/user-attachments/assets/2faedf76-7e56-4c20-876d-bcbda32f8ced" />
<img width="2491" height="1012" alt="image" src="https://github.com/user-attachments/assets/00217e04-18b7-4294-b985-3808325a35f8" />
<img width="1017" height="692" alt="image" src="https://github.com/user-attachments/assets/30c673e7-6118-4b73-b070-13629cbee0e9" />
<img width="726" height="197" alt="image" src="https://github.com/user-attachments/assets/caf0f3bb-c120-4f77-847c-bae362dd1ec0" />
<img width="991" height="637" alt="image" src="https://github.com/user-attachments/assets/0e7648eb-68c5-407d-8f2d-fb4146a47163" />
<img width="2492" height="1107" alt="image" src="https://github.com/user-attachments/assets/ce7ccb4a-7ca2-4b10-8ceb-1634f75ae0c3" />
<img width="1012" height="955" alt="image" src="https://github.com/user-attachments/assets/8747818c-6fe5-42b9-9584-3a12a45ea21c" />
<img width="1032" height="431" alt="image" src="https://github.com/user-attachments/assets/58fb46f8-487c-4f44-b5bb-c545dc9159e2" />
<img width="973" height="1010" alt="image" src="https://github.com/user-attachments/assets/0da10b12-1f2c-4dfd-8ab8-b9d9cfc1f337" />
<img width="987" height="1107" alt="image" src="https://github.com/user-attachments/assets/ac5b4f9e-7409-48b5-8b4a-b2232098a68d" />
<img width="1002" height="1116" alt="image" src="https://github.com/user-attachments/assets/5bae7e20-3ea7-40b3-8f58-76dc7d4e5c1a" />
<img width="990" height="1042" alt="image" src="https://github.com/user-attachments/assets/3b2f435e-dcbc-4919-a89d-966c96cee787" />
<img width="987" height="672" alt="image" src="https://github.com/user-attachments/assets/8eb4ace3-9166-430f-957b-7cc0ddd81b27" />
<img width="998" height="301" alt="image" src="https://github.com/user-attachments/assets/b17d86ab-5226-4bfe-a231-a3a4525edcb9" />
<img width="2448" height="450" alt="image" src="https://github.com/user-attachments/assets/d04836c7-9d06-4c6e-b188-ab5b63e947e8" />
<img width="1050" height="787" alt="image" src="https://github.com/user-attachments/assets/a42795a7-2f3d-41ab-9d6e-4fdac6cd4eae" />
<img width="993" height="1263" alt="image" src="https://github.com/user-attachments/assets/a2be24d1-71d5-4755-8e70-915b64a43f1b" />
<img width="997" height="312" alt="image" src="https://github.com/user-attachments/assets/fcb1240f-89a0-4464-bf68-0b7332643bd1" />
<img width="2420" height="1232" alt="image" src="https://github.com/user-attachments/assets/b82e64ad-71f3-434f-8cf3-c418d439a7bf" />
<img width="2401" height="1192" alt="image" src="https://github.com/user-attachments/assets/867f98fc-045c-4535-8c01-74e2627581f6" />
<img width="1012" height="975" alt="image" src="https://github.com/user-attachments/assets/ce2f97ea-11b1-48d7-ab6f-07783c07d7b2" />
<img width="996" height="986" alt="image" src="https://github.com/user-attachments/assets/d93671a4-2f69-4026-a234-aaf9122a9f7d" />
<img width="1887" height="1345" alt="image" src="https://github.com/user-attachments/assets/54945711-af2c-4dc0-ac44-3ae51b41f4c3" />
<img width="2517" height="1067" alt="image" src="https://github.com/user-attachments/assets/e0ebab7c-def0-4017-9372-0eb18f4475e0" />
<img width="2477" height="1076" alt="image" src="https://github.com/user-attachments/assets/ed07690a-05b0-4794-9892-44ea7a72df65" />
<img width="2468" height="1330" alt="image" src="https://github.com/user-attachments/assets/e86929c0-fd40-4d35-9371-4a384e7d610c" />

