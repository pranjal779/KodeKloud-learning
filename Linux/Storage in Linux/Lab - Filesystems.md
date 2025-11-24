<img width="1620" height="1221" alt="image" src="https://github.com/user-attachments/assets/475d16db-fe54-4954-a6bb-f921008c450d" />
<img width="1022" height="597" alt="image" src="https://github.com/user-attachments/assets/d1c67ced-b477-455d-8389-fe52a2eca696" />
<img width="888" height="247" alt="image" src="https://github.com/user-attachments/assets/746a7295-0fc6-4e89-b072-fab29eb87046" />
<img width="1075" height="635" alt="image" src="https://github.com/user-attachments/assets/230d1f66-2b48-40fc-a10d-bb01e8fee643" />
<img width="1007" height="572" alt="image" src="https://github.com/user-attachments/assets/675da3cd-1de4-46f8-94ba-f4948c597fa4" />
<img width="1072" height="375" alt="image" src="https://github.com/user-attachments/assets/6e90f94e-ed0d-41cc-8180-467dcba53d1a" />
<img width="2121" height="715" alt="image" src="https://github.com/user-attachments/assets/8ecc681e-72c2-4beb-98e1-82fafe4b6107" />
<img width="1046" height="807" alt="image" src="https://github.com/user-attachments/assets/46c88dde-6861-4e2a-b097-da96a287ae88" />
<img width="708" height="282" alt="image" src="https://github.com/user-attachments/assets/47df9440-22e5-4ce0-a635-3110971c7097" />
<img width="2220" height="842" alt="image" src="https://github.com/user-attachments/assets/9b1598fc-9e77-4500-8813-76cf93319580" />

```sh
sudo blkid /dev/vdd  # here /dev/vdd is the file system
```

<img width="2197" height="832" alt="image" src="https://github.com/user-attachments/assets/f105f0d4-3873-4a57-9bc8-8f32b93632f2" />

<img width="2182" height="756" alt="image" src="https://github.com/user-attachments/assets/e6414cdf-d989-4960-a108-ac61028dae2e" />
<img width="570" height="401" alt="image" src="https://github.com/user-attachments/assets/14808267-e59d-4abd-8d5e-499f2df52a76" />
Run: sudo mkfs.ext4 /dev/vde

sudo mkdir /mnt/data

sudo  mount /dev/vde /mnt/data

<img width="2245" height="1217" alt="image" src="https://github.com/user-attachments/assets/8fe653f7-d27e-41f3-8530-5e3468ef970f" />
<img width="1017" height="713" alt="image" src="https://github.com/user-attachments/assets/ef97c3d7-7971-47b6-bb4d-64eaa2b5f1c7" />
<img width="992" height="337" alt="image" src="https://github.com/user-attachments/assets/89572fd2-f9d5-4b04-affc-203f68a496af" />
<img width="1027" height="668" alt="image" src="https://github.com/user-attachments/assets/220c26f8-291a-4cfa-9da4-521c5157a858" />
<img width="1025" height="577" alt="image" src="https://github.com/user-attachments/assets/7572995f-5899-4cad-8dab-f02b71fd3553" />
<img width="738" height="456" alt="image" src="https://github.com/user-attachments/assets/e1169be9-bf67-48be-bd36-9038c0e21e24" />
Add it in the FSTAB

Run: sudo vi /etc/fstab

Add the line /dev/vde /mnt/data ext4 rw 0 0

Save and Exit.

<img width="2125" height="532" alt="image" src="https://github.com/user-attachments/assets/842d2908-406e-42eb-abf6-1bedfb7e442e" />

<img width="2082" height="670" alt="image" src="https://github.com/user-attachments/assets/77f0c073-d3c4-41db-9c8f-46dc3a022491" />

