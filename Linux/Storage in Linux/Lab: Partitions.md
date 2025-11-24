<img width="1560" height="1007" alt="image" src="https://github.com/user-attachments/assets/daa5b477-611a-4957-8966-049a39d22ddd" />
<img width="2042" height="615" alt="image" src="https://github.com/user-attachments/assets/59496030-f32c-4e52-8e94-a59247b46d24" />
<img width="1953" height="733" alt="image" src="https://github.com/user-attachments/assets/c3fe76aa-225c-4f77-8cbe-3643c00ad26d" />
<img width="1953" height="733" alt="image" src="https://github.com/user-attachments/assets/a099f94e-165c-4af7-9b99-f48d7f0a5c49" />
<img width="1003" height="698" alt="image" src="https://github.com/user-attachments/assets/1b94d822-8f33-47a5-83f5-bbb68e883d33" />
<img width="982" height="721" alt="image" src="https://github.com/user-attachments/assets/7ac0a2a3-0bc4-4806-94aa-82add0b0368d" />
<img width="1966" height="726" alt="image" src="https://github.com/user-attachments/assets/bac1cbc5-e851-4581-9db2-f9440941bed5" />
<img width="2181" height="690" alt="image" src="https://github.com/user-attachments/assets/9298bcd3-54c4-45ca-897d-e98ec4535841" />

The maximum number of primary partitions in an MBR scheme is 4. If you'd like to verify partition info and understand the current structure, run:

sudo fdisk -l /dev/sdX

Replace /dev/sdX with your disk name (like /dev/vda).

This command shows partition types (primary, extended, logical), helping you see the current setup.

lsblk shows block devices and partitions, but doesn't specify whether partitions are primary or extended—fdisk -l is your best bet!

<img width="2181" height="690" alt="image" src="https://github.com/user-attachments/assets/1f7238b2-113c-42e1-b8cd-15697054ed73" />
<img width="2106" height="682" alt="image" src="https://github.com/user-attachments/assets/46c497e5-95d8-4ac2-a5c6-6c70afb6e7ee" />
<img width="798" height="341" alt="image" src="https://github.com/user-attachments/assets/6971770b-579b-4abf-93de-aae95a327a1f" />
<img width="2155" height="1276" alt="image" src="https://github.com/user-attachments/assets/669755cb-bf33-46bf-840c-6080cfce4a61" />
<img width="2088" height="1231" alt="image" src="https://github.com/user-attachments/assets/a77d4d95-7a5b-45a6-840d-e95c0be38a9a" />
<img width="1062" height="575" alt="image" src="https://github.com/user-attachments/assets/f09189d6-ece5-4783-aa7d-baea2fd546e5" />
<img width="798" height="645" alt="image" src="https://github.com/user-attachments/assets/a8e6f174-99be-4207-bf66-022021a48711" />

Run: sudo gdisk /dev/vde

In the interactive prompt, enter n

Select parition number = 1 (for vde1)

Select default first sector = 2048

Select +500M when asked for last sector

Use default hex code = 8300

Finally type w to write to the partition table

<img width="2127" height="885" alt="image" src="https://github.com/user-attachments/assets/ded0110a-a2d3-4599-a335-510df3bab83e" />
<img width="2205" height="1052" alt="image" src="https://github.com/user-attachments/assets/6d0f0d09-92c6-4aaa-8262-3069d3619d55" />
<img width="2201" height="1108" alt="image" src="https://github.com/user-attachments/assets/8b8ce3d2-2724-484e-aec8-236205853559" />
