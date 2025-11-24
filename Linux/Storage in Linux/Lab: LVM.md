<img width="1665" height="1122" alt="image" src="https://github.com/user-attachments/assets/652d8a73-2b3f-4082-abf4-f8b89ec3b1c8" />
<img width="1000" height="550" alt="image" src="https://github.com/user-attachments/assets/4b19b7d0-3f61-4975-8b18-33113f2d041d" />
<img width="1057" height="592" alt="image" src="https://github.com/user-attachments/assets/baafbe75-538c-41ac-86b5-9e79b79d9cbe" />

bob@caleston-lp10 ~ ➜  lvs
  WARNING: Running as a non-root user. Functionality may be unavailable.
  /run/lock/lvm/P_global:aux: open failed: Permission denied

bob@caleston-lp10 ~ ✖ sudo lvs
  LV     VG     Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
  lvdata vgdata -wi-ao---- 1.50g                                                    

bob@caleston-lp10 ~ ➜  sudo pvdisplay
  --- Physical volume ---
  PV Name               /dev/vdd
  VG Name               vgdata
  PV Size               2.00 GiB / not usable 4.00 MiB
  Allocatable           yes 
  PE Size               4.00 MiB
  Total PE              511
  Free PE               127
  Allocated PE          384
  PV UUID               d7cF65-m6lc-gRKd-jU1f-Qs9n-OOcI-hmpVMr
   

bob@caleston-lp10 ~ ➜  


<img width="2193" height="1083" alt="image" src="https://github.com/user-attachments/assets/018b710a-6ed5-44b8-8421-77a6143ffb07" />

<img width="990" height="743" alt="image" src="https://github.com/user-attachments/assets/fd637d89-34a9-486e-81ec-554e54fa0d61" />

<img width="540" height="222" alt="image" src="https://github.com/user-attachments/assets/01ebd31b-6913-48c6-ac58-45cbf686e69c" />
<img width="2226" height="942" alt="image" src="https://github.com/user-attachments/assets/758f9caa-b439-4e7d-a206-7115b7c87603" />
<img width="2215" height="912" alt="image" src="https://github.com/user-attachments/assets/868375e9-f7ae-457d-aa33-615f5f38224b" />
<img width="2185" height="846" alt="image" src="https://github.com/user-attachments/assets/663c31e7-067f-4bd9-9514-54a81e519d7e" />
<img width="1042" height="735" alt="image" src="https://github.com/user-attachments/assets/da5078b8-fbad-40f3-a0b1-bfc9443bae88" />
<img width="986" height="242" alt="image" src="https://github.com/user-attachments/assets/3712b3d5-e556-435f-933b-d61fd7a6b50b" />
<img width="1831" height="765" alt="image" src="https://github.com/user-attachments/assets/735c95e3-fa73-4807-8d30-7fd6dbee2a0b" />
<img width="1057" height="536" alt="image" src="https://github.com/user-attachments/assets/93815c42-15a7-42dd-9b86-9080f12e87ad" />
<img width="1027" height="217" alt="image" src="https://github.com/user-attachments/assets/a039b580-811e-40c7-b96b-d7a4186f2583" />
<img width="1970" height="820" alt="image" src="https://github.com/user-attachments/assets/8798eb29-d1a8-45bb-bab9-7effae68928f" />
<img width="1885" height="841" alt="image" src="https://github.com/user-attachments/assets/4b630bd4-da78-46b6-a3ad-ba7538fbcb50" />

```
bob@caleston-lp10 ~ ➜  sudo lsblk
NAME            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
vda             252:0    0   10G  0 disk 
├─vda1          252:1    0  9.9G  0 part /
├─vda14         252:14   0    4M  0 part 
└─vda15         252:15   0  106M  0 part /boot/efi
vdb             252:16   0    1M  0 disk /mnt/app-config
vdc             252:32   0    1M  0 disk 
vdd             252:48   0    2G  0 disk 
└─vgdata-lvdata 253:0    0  1.5G  0 lvm  /mnt/lvm
vde             252:64   0    1G  0 disk 
vdf             252:80   0    1G  0 disk 

bob@caleston-lp10 ~ ➜  sudo pvcreate /dev/vde
  Physical volume "/dev/vde" successfully created.

bob@caleston-lp10 ~ ➜  sudo pvcreate /dev/vdf
  Physical volume "/dev/vdf" successfully created.

bob@caleston-lp10 ~ ➜  

```

<img width="1812" height="743" alt="image" src="https://github.com/user-attachments/assets/79eff085-fdf9-40da-9ed9-b308ed43d897" />

<img width="1012" height="551" alt="image" src="https://github.com/user-attachments/assets/f0bbe0c1-f4aa-4b5a-bad5-74b1047c752d" />
<img width="742" height="287" alt="image" src="https://github.com/user-attachments/assets/162a53fc-68a2-4919-b86a-1d4a175d402d" />

```sh

bob@caleston-lp10 ~ ➜  sudo vgcreate caleston_vg /dev/vde /dev/vdf
  Volume group "caleston_vg" successfully created

```
<img width="2071" height="977" alt="image" src="https://github.com/user-attachments/assets/24871f5f-49e7-49fb-abb7-a59913ea9fa9" />
<img width="1027" height="693" alt="image" src="https://github.com/user-attachments/assets/caef4db4-ed90-4192-ae73-1e26b8806fc2" />
<img width="635" height="291" alt="image" src="https://github.com/user-attachments/assets/1ffca008-b86a-4942-9e11-ed0f4ba410f6" />

```sh
bob@caleston-lp10 ~ ➜  sudo lvcreate -L 1G -n data caleston_vg
  Logical volume "data" created.

bob@caleston-lp10 ~ ➜
```

<img width="2062" height="981" alt="image" src="https://github.com/user-attachments/assets/23662186-fa0f-4e13-8802-9f1384fd819f" />

<img width="2000" height="952" alt="image" src="https://github.com/user-attachments/assets/21f78582-c0f1-402c-8552-c544e4600a3d" />
<img width="700" height="341" alt="image" src="https://github.com/user-attachments/assets/152ba290-007b-4f55-a726-1456adea1dfd" />

```sh
Run: sudo mkdir /mnt/media
sudo mkfs.ext4 /dev/mapper/caleston_vg-data
sudo mount /dev/mapper/caleston_vg-data /mnt/media/
```

<img width="2002" height="1312" alt="image" src="https://github.com/user-attachments/assets/e54bf49e-580e-4222-a9ab-6eb86644a540" />


<img width="1018" height="602" alt="image" src="https://github.com/user-attachments/assets/b096c63c-a530-4def-8585-d4c043852778" />
<img width="1020" height="291" alt="image" src="https://github.com/user-attachments/assets/e768bba4-edee-4967-9bcb-f77dda4daea9" />

```sh
Run: sudo lvresize -L +500M /dev/mapper/caleston_vg-data

sudo resize2fs /dev/mapper/caleston_vg-data
```


'''sh

bob@caleston-lp10 ~ ➜  sudo lvresize -L +500M /dev/mapper/caleston_vg-data
  Size of logical volume caleston_vg/data changed from 1.00 GiB (256 extents) to <1.49 GiB (381 extents).
  Logical volume caleston_vg/data successfully resized.

bob@caleston-lp10 ~ ➜  sudo resize2fs /dev/mapper/caleston_vg-data
resize2fs 1.46.5 (30-Dec-2021)
Filesystem at /dev/mapper/caleston_vg-data is mounted on /mnt/media; on-line resizing required
old_desc_blocks = 1, new_desc_blocks = 1
The filesystem on /dev/mapper/caleston_vg-data is now 390144 (4k) blocks long.


bob@caleston-lp10 ~ ➜  
```
<img width="2407" height="730" alt="image" src="https://github.com/user-attachments/assets/a0d45f84-09b6-441c-9fb0-f356c071cb2e" />

```sh
bob@caleston-lp10 ~ ➜  history
    1  lvs
    2  sudo lvs
    3  sudo pvdisplay
    4  clear
    5  sudo lsblk
    6  sudo pvcreate /dev/vde
    7  sudo pvcreate /dev/vdf
    8  sudo vgcreate caleston_vg /dev/vde /dev/vdf
    9  sudo lvcreate -L 1G -n data caleston_vg
   10  sudo mkdir /mnt/media
   11  sudo mkfs.ext4 /dev/mapper/caleston_vg-data
   12  sudo mount /dev/mapper/caleston_vg-data /mnt/media
   13  clear
   14  sudo lvresize -L +500M /dev/mapper/caleston_vg-data
   15  sudo resize2fs /dev/mapper/caleston_vg-data
   16  history

bob@caleston-lp10 ~ ➜  

```
