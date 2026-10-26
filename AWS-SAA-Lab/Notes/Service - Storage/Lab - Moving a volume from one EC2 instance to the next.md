# Lab - Moving a volume from one EC2 instance to the next

<img width="958" height="780" alt="image" src="https://github.com/user-attachments/assets/b8bd8e00-c8fe-415f-88fe-70d5d6d5ce1a" />
<img width="951" height="908" alt="image" src="https://github.com/user-attachments/assets/0f4f5ecd-1ae0-46ca-9aa3-59958491679d" />
<img width="2182" height="1062" alt="image" src="https://github.com/user-attachments/assets/9d14b9ef-cada-4332-a812-08e5888ecba6" />
<img width="1026" height="1062" alt="image" src="https://github.com/user-attachments/assets/84d1ce61-4f7c-4aef-a220-71b25cfb7ed9" />
<img width="2251" height="797" alt="image" src="https://github.com/user-attachments/assets/c2b83dc2-11a3-46c2-83b7-dce1446995fb" />
<img width="2206" height="792" alt="image" src="https://github.com/user-attachments/assets/a8f9f2bc-627f-4e54-b3a3-1b05c8617ee9" />


---


<img width="2267" height="1002" alt="image" src="https://github.com/user-attachments/assets/86ffd356-e12a-4a50-a24c-d457630a07ee" />
<img width="1622" height="685" alt="image" src="https://github.com/user-attachments/assets/e6fe61db-6231-4712-a993-a6ba5074e854" />
<img width="1640" height="793" alt="image" src="https://github.com/user-attachments/assets/d988335c-f710-4b5b-8065-5b4b3500aefd" />
<img width="987" height="893" alt="image" src="https://github.com/user-attachments/assets/cf58e5b6-640f-4e2d-afa2-38380f063ac4" />
<img width="906" height="477" alt="image" src="https://github.com/user-attachments/assets/9e10caa3-305b-4e94-bd8d-e8cc22f554e4" />
<img width="1132" height="832" alt="image" src="https://github.com/user-attachments/assets/7a79f042-8f3a-4298-a20f-6fef9366102b" />
<img width="2437" height="1086" alt="image" src="https://github.com/user-attachments/assets/ddc7ad55-7556-4ec3-8b51-f2414be1225b" />
<img width="1945" height="957" alt="image" src="https://github.com/user-attachments/assets/7c3368ca-91a6-4008-b694-d8f6d708dcef" />
<img width="2412" height="1111" alt="image" src="https://github.com/user-attachments/assets/80f0186b-38cc-4c5c-8504-56308dbd5285" />
<img width="1012" height="375" alt="image" src="https://github.com/user-attachments/assets/7bc714a1-db5c-44f5-a033-9084b4836ffe" />
<img width="1088" height="338" alt="image" src="https://github.com/user-attachments/assets/6aec6f93-6dc0-4d47-98ae-bb3b4f0fcff2" />
<img width="1972" height="1118" alt="image" src="https://github.com/user-attachments/assets/f0f1429f-77d8-43ec-aef6-0dea081620f0" />
<img width="2211" height="1102" alt="image" src="https://github.com/user-attachments/assets/ea534d35-8789-46d0-b77e-cabed5660e12" />
<img width="1017" height="702" alt="image" src="https://github.com/user-attachments/assets/918dbfcd-a2a2-4744-bbd9-deba3a330aa6" />
<img width="995" height="452" alt="image" src="https://github.com/user-attachments/assets/9a9544e7-6550-47db-9ec2-36f9c6a88919" />
<img width="2153" height="1118" alt="image" src="https://github.com/user-attachments/assets/dded042c-1e51-4f4c-abff-1ea33aaf4128" />
<img width="2127" height="1126" alt="image" src="https://github.com/user-attachments/assets/3e66cb53-7cfd-407d-9f75-ec18fab64b7e" />
<img width="1027" height="566" alt="image" src="https://github.com/user-attachments/assets/b93b20eb-8560-444a-9902-36eba27eaa58" />
<img width="2087" height="1142" alt="image" src="https://github.com/user-attachments/assets/8e4a0e62-33fb-4fdf-b2b1-69f8a8315a1b" />





```sh
~ on ☁️  (us-east-1) ➜  chmod 400 /home/rdskeypair.pem

~ on ☁️  (us-east-1) ➜  ls /home/rdskeypair.pem
/home/rdskeypair.pem

~ on ☁️  (us-east-1) ➜  ls -l /home/rdskeypair.pem
-r-------- 1 root root 1679 Oct 26 15:39 /home/rdskeypair.pem

~ on ☁️  (us-east-1) ➜  chmod 400 /home/rdskeypair.pem

~ on ☁️  (us-east-1) ➜  ls -l /home/rdskeypair.pem
-r-------- 1 root root 1679 Oct 26 15:39 /home/rdskeypair.pem

~ on ☁️  (us-east-1) ➜  chmod +x /home/rdskeypair.pem

~ on ☁️  (us-east-1) ➜  ls -l /home/rdskeypair.pem
-r-x--x--x 1 root root 1679 Oct 26 15:39 /home/rdskeypair.pem

~ on ☁️  (us-east-1) ➜  chmod +r-x /home/rdskeypair.pem

~ on ☁️  (us-east-1) ➜  ls -l /home/rdskeypair.pem
-r--r--r-- 1 root root 1679 Oct 26 15:39 /home/rdskeypair.pem

~ on ☁️  (us-east-1) ➜  chmod 400 /home/rdskeypair.pem

~ on ☁️  (us-east-1) ➜  ls -l /home/rdskeypair.pem
-r-------- 1 root root 1679 Oct 26 15:39 /home/rdskeypair.pem

~ on ☁️  (us-east-1) ➜  ssh -i "rdskeypair.pem" ec2-user@ec2-184-193-27-164.compute-1.amazonaws.com
Warning: Identity file rdskeypair.pem not accessible: No such file or directory.
The authenticity of host 'ec2-184-193-27-164.compute-1.amazonaws.com (184.193.27.164)' can't be established.
ED25519 key fingerprint is SHA256:kIHsNragk/CUwT68rrkSvyhxmH1nEBxDynU5C/D3hrU.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'ec2-184-193-27-164.compute-1.amazonaws.com' (ED25519) to the list of known hosts.
ec2-user@ec2-184-193-27-164.compute-1.amazonaws.com: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).

~ on ☁️  (us-east-1) ✖ chmod 400 "rdskeypair.pem"
chmod: cannot access 'rdskeypair.pem': No such file or directory

~ on ☁️  (us-east-1) ✖ ssh -i "rdskeypair.pem" ec2-user@ec2-184-193-27-164.compute-1.amazonaws.com
Warning: Identity file rdskeypair.pem not accessible: No such file or directory.
ec2-user@ec2-184-193-27-164.compute-1.amazonaws.com: Permission denied (publickey,gssapi-keyex,gssapi-with-mic).

~ on ☁️  (us-east-1) ✖ ssh -i /home/rdskeypair.pem ec2-user@ec2-184-193-27-164.compute-1.amazonaws.com

  Version 2023.9.20251110:
  Version 2023.9.20251117:
  Version 2023.9.20251208:
Run "/usr/bin/dnf check-release-update" for full release and version update info
   ,     #_
   ~\_  ####_        Amazon Linux 2023
  ~~  \_#####\
  ~~     \###|
  ~~       \#/ ___   https://aws.amazon.com/linux/amazon-linux-2023
   ~~       V~' '->
    ~~~         /
      ~~._.   _/
         _/ _/
       _/m/'
[ec2-user@ip-172-31-7-233 ~]$ sudo file -s /dev/xvdf
/dev/xvdf: data
[ec2-user@ip-172-31-7-233 ~]$ lsblk
NAME      MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
xvda      202:0    0   8G  0 disk 
├─xvda1   202:1    0   8G  0 part /
├─xvda127 259:0    0   1M  0 part 
└─xvda128 259:1    0  10M  0 part 
xvdf      202:80   0  20G  0 disk 
[ec2-user@ip-172-31-7-233 ~]$ sudo mkfs -t xfs /dev/xvdf
meta-data=/dev/xvdf              isize=512    agcount=4, agsize=1310720 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=1, rmapbt=0
         =                       reflink=1    bigtime=1 inobtcount=1
data     =                       bsize=4096   blocks=5242880, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
log      =internal log           bsize=4096   blocks=16384, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
[ec2-user@ip-172-31-7-233 ~]$ cd /home/ec2-user
[ec2-user@ip-172-31-7-233 ~]$ pwd
/home/ec2-user
[ec2-user@ip-172-31-7-233 ~]$ mkdir ebsdemo/
[ec2-user@ip-172-31-7-233 ~]$ ls -ll
total 0
drwxr-xr-x. 2 ec2-user ec2-user 6 Oct 26 15:59 ebsdemo
[ec2-user@ip-172-31-7-233 ~]$ lsblk
NAME      MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
xvda      202:0    0   8G  0 disk 
├─xvda1   202:1    0   8G  0 part /
├─xvda127 259:0    0   1M  0 part 
└─xvda128 259:1    0  10M  0 part 
xvdf      202:80   0  20G  0 disk 
[ec2-user@ip-172-31-7-233 ~]$


```


<img width="2107" height="1125" alt="image" src="https://github.com/user-attachments/assets/4a875555-d72f-44ff-956d-9ae2c6158d80" />

```sh
[ec2-user@ip-172-31-7-233 ~]$ cd /home/ec2-user
[ec2-user@ip-172-31-7-233 ~]$ pwd
/home/ec2-user
[ec2-user@ip-172-31-7-233 ~]$ mkdir ebsdemo/
[ec2-user@ip-172-31-7-233 ~]$ ls -ll
total 0
drwxr-xr-x. 2 ec2-user ec2-user 6 Oct 26 15:59 ebsdemo
[ec2-user@ip-172-31-7-233 ~]$ lsblk
NAME      MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
xvda      202:0    0   8G  0 disk 
├─xvda1   202:1    0   8G  0 part /
├─xvda127 259:0    0   1M  0 part 
└─xvda128 259:1    0  10M  0 part 
xvdf      202:80   0  20G  0 disk 
[ec2-user@ip-172-31-7-233 ~]$ sudo mount /dev/xvdf /home/ec2-user/ebsdemo
[ec2-user@ip-172-31-7-233 ~]$ df -k
Filesystem     1K-blocks    Used Available Use% Mounted on
devtmpfs            4096       0      4096   0% /dev
tmpfs             486288       0    486288   0% /dev/shm
tmpfs             194516    2852    191664   2% /run
/dev/xvda1       8310764 1554764   6756000  19% /
tmpfs             486292       0    486292   0% /tmp
tmpfs              97256       0     97256   0% /run/user/1000
/dev/xvdf       20905984  178812  20727172   1% /home/ec2-user/ebsdemo
[ec2-user@ip-172-31-7-233 ~]$

```

<img width="2152" height="1152" alt="image" src="https://github.com/user-attachments/assets/51460b72-5dc0-46d8-9f7b-5e2bab207413" />
<img width="1007" height="572" alt="image" src="https://github.com/user-attachments/assets/d4ee9e16-0049-486b-bc89-641d9ce05ee3" />
<img width="991" height="411" alt="image" src="https://github.com/user-attachments/assets/5f4602a0-268f-45a0-839f-b25dc09384e1" />
<img width="1515" height="272" alt="image" src="https://github.com/user-attachments/assets/1259c6a9-26f6-499c-89b9-74a1a7afae39" />
<img width="1457" height="290" alt="image" src="https://github.com/user-attachments/assets/cc41586e-5dc8-4b76-be3b-4bb654dc1c61" />


```sh
[ec2-user@ip-172-31-7-233 ~]$ sudo blkid
/dev/xvda128: SEC_TYPE="msdos" UUID="CE70-438F" BLOCK_SIZE="512" TYPE="vfat" PARTLABEL="EFI System Partition" PARTUUID="aa396853-039f-4cfa-b21d-d5ef8adf173d"
/dev/xvda127: PARTLABEL="BIOS Boot Partition" PARTUUID="77f29620-e5ee-4c47-9550-3e246fcbc39d"
/dev/xvda1: LABEL="/" UUID="3325c0ba-3d91-4d25-bb13-bdc5c47a979a" BLOCK_SIZE="4096" TYPE="xfs" PARTLABEL="Linux" PARTUUID="1ac16fba-91ed-4397-9bc1-b8ae6170986f"
/dev/xvdf: UUID="9c2402c5-34a8-4517-adfd-3e17ecdbd7b4" BLOCK_SIZE="512" TYPE="xfs"
[ec2-user@ip-172-31-7-233 ~]$ UUID="9c2402c5-34a8-4517-adfd-3e17ecdbd7b4" /home/ec2-user/ebsdemo xfs defaults nofail
-bash: /home/ec2-user/ebsdemo: Is a directory
[ec2-user@ip-172-31-7-233 ~]$ echo "UUID=9c2402c5-34a8-4517-adfd-3e17ecdbd7b4 /home/ec2-user/ebsdemo xfs defaults,nofail 0 2" | sudo tee -a /etc/fstab
UUID=9c2402c5-34a8-4517-adfd-3e17ecdbd7b4 /home/ec2-user/ebsdemo xfs defaults,nofail 0 2
[ec2-user@ip-172-31-7-233 ~]$
```

<img width="1515" height="460" alt="image" src="https://github.com/user-attachments/assets/94f905e2-4ac0-4b65-afcd-7884ea16cef5" />
<img width="2477" height="1160" alt="image" src="https://github.com/user-attachments/assets/b5a5e9fd-ca3d-4a25-8889-7b850b908a45" />
<img width="1002" height="497" alt="image" src="https://github.com/user-attachments/assets/86fc09f4-8cbb-499a-bd6e-ad454d9f4dd4" />
<img width="2501" height="1091" alt="image" src="https://github.com/user-attachments/assets/8537eb76-d269-4934-937a-a5c71aa15885" />
<img width="2412" height="1138" alt="image" src="https://github.com/user-attachments/assets/ed48c2de-26ef-47df-b48c-ce2cc3a2fb16" />
<img width="2355" height="1125" alt="image" src="https://github.com/user-attachments/assets/81e1f4b6-b3f7-48f2-bbaf-6925b90567ec" />
<img width="1946" height="1101" alt="image" src="https://github.com/user-attachments/assets/9bfc2198-dad4-4038-beeb-7045351a3335" />
<img width="1022" height="465" alt="image" src="https://github.com/user-attachments/assets/24a9ea21-cc3c-4ece-8fcc-84e4559bfef7" />
<img width="990" height="877" alt="image" src="https://github.com/user-attachments/assets/7270c099-4dbd-4256-b6e0-d2793a9e37fe" />
<img width="981" height="175" alt="image" src="https://github.com/user-attachments/assets/3b0f8761-1a8e-4481-937d-901a6bcbc67a" />
<img width="2146" height="382" alt="image" src="https://github.com/user-attachments/assets/7d0ca18a-7f4b-4114-b0c3-8032d21454fe" />
<img width="1958" height="1115" alt="image" src="https://github.com/user-attachments/assets/f6b9f24c-c672-47b3-8536-feac91445c7d" />
<img width="1007" height="857" alt="image" src="https://github.com/user-attachments/assets/1796353b-6ad4-4f43-a90c-0a4a363c3377" />
<img width="2390" height="847" alt="image" src="https://github.com/user-attachments/assets/c9190579-e7cc-457b-a8f7-64af30df63d8" />
<img width="2095" height="1136" alt="image" src="https://github.com/user-attachments/assets/b968d59e-f5bb-4ed9-b2b5-537a095580be" />
<img width="2311" height="1005" alt="image" src="https://github.com/user-attachments/assets/2436044f-9d9d-4f30-a79b-ae153e12893d" />
<img width="985" height="912" alt="image" src="https://github.com/user-attachments/assets/bb70e770-513c-42b1-814d-c406d4347cfb" />

```sh
       _/m/'
[ec2-user@ip-172-31-3-46 ~]$ cd /home/ec2-user/
[ec2-user@ip-172-31-3-46 ~]$ mkdir ebsdemo
[ec2-user@ip-172-31-3-46 ~]$ sudo mount /dev/xvdf /home/ec2-user/ebsdemo/
[ec2-user@ip-172-31-3-46 ~]$ lsblk
NAME      MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS
xvda      202:0    0   8G  0 disk 
├─xvda1   202:1    0   8G  0 part /
├─xvda127 259:0    0   1M  0 part 
└─xvda128 259:1    0  10M  0 part 
xvdf      202:80   0  20G  0 disk /home/ec2-user/ebsdemo
[ec2-user@ip-172-31-3-46 ~]$ 
```

<img width="2261" height="1105" alt="image" src="https://github.com/user-attachments/assets/207c1fc6-8eff-496e-bc99-8bd63ae5e5e8" />
<img width="2101" height="1162" alt="image" src="https://github.com/user-attachments/assets/1227c98c-3735-4207-97a9-0120c6cba903" />
<img width="2127" height="1128" alt="image" src="https://github.com/user-attachments/assets/a639f04d-ac99-430b-bcf0-da272e2e5bcd" />
<img width="978" height="645" alt="image" src="https://github.com/user-attachments/assets/15f6173a-c72e-4297-a60f-2aa7d46889a5" />
<img width="983" height="687" alt="image" src="https://github.com/user-attachments/assets/473a3d89-f684-4593-87a0-e63e80fe78d0" />
<img width="2337" height="707" alt="image" src="https://github.com/user-attachments/assets/74d1c74d-66a2-4648-b00b-1417d10076e8" />
<img width="927" height="791" alt="image" src="https://github.com/user-attachments/assets/134922c5-f956-4745-99c7-c9f351659859" />
<img width="1177" height="883" alt="image" src="https://github.com/user-attachments/assets/9cf7569f-e3ee-4f13-9ae4-2bb1aed90fea" />
<img width="1977" height="383" alt="image" src="https://github.com/user-attachments/assets/355ed8bb-4bdd-42ff-9f91-5ea06d3501ba" />
<img width="2326" height="986" alt="image" src="https://github.com/user-attachments/assets/e68afc4b-4445-4794-90e8-2ca73cb487ba" />
<img width="1192" height="955" alt="image" src="https://github.com/user-attachments/assets/a9eff13e-c9d1-4059-afe8-138d800153b8" />
<img width="1213" height="906" alt="image" src="https://github.com/user-attachments/assets/6e551a31-7a62-4e2e-95c3-49dba1d9eb44" />
<img width="2401" height="937" alt="image" src="https://github.com/user-attachments/assets/ef6fb8bd-6a57-44ed-b984-011c1f7b5ca5" />
<img width="2007" height="1125" alt="image" src="https://github.com/user-attachments/assets/5d9d28ae-1724-4dc9-b25f-58a8ecc79702" />

<img width="2212" height="1152" alt="image" src="https://github.com/user-attachments/assets/1ad63c86-d195-441c-b726-90f8eaa4fa8e" />
<img width="1005" height="1045" alt="image" src="https://github.com/user-attachments/assets/1ae6cdae-1b65-4017-8026-a0b80a401533" />
<img width="2200" height="1106" alt="image" src="https://github.com/user-attachments/assets/0ed61f6e-23f4-4187-b60d-0970604775f4" />
<img width="2076" height="1117" alt="image" src="https://github.com/user-attachments/assets/8d4310da-f622-4dbb-b585-f470a7db34d1" />











