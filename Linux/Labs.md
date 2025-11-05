<img width="1792" height="576" alt="image" src="https://github.com/user-attachments/assets/dd570762-59e6-4f4a-bcb1-70966055a19b" />
<img width="1805" height="617" alt="image" src="https://github.com/user-attachments/assets/0bd1decf-2cb0-4bfa-8d0f-c088dbe18f6e" />
<img width="937" height="522" alt="image" src="https://github.com/user-attachments/assets/485911cb-7e42-4adc-a3e6-b592e2d28726" />
<img width="912" height="523" alt="image" src="https://github.com/user-attachments/assets/4dac918e-09df-420f-8b86-851e68f3eba9" />
<img width="895" height="610" alt="image" src="https://github.com/user-attachments/assets/f69a5118-14a7-4b7f-bb84-cbd86fff4f8b" />
<img width="1775" height="808" alt="image" src="https://github.com/user-attachments/assets/21b0d13f-211b-4eca-8020-85cfda0acc27" />
<img width="1775" height="808" alt="image" src="https://github.com/user-attachments/assets/40c22ed0-5109-4b12-abab-883fb22aed45" />

```sh
bob@caleston-lp10:~$ lsblk
lsblk: /proc/swaps: parse error at line 1 -- ignored
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda       8:0    0   20G  0 disk 
|-sda1    8:1    0 19.9G  0 part /dev/termination-log
|-sda14   8:14   0    4M  0 part 
`-sda15   8:15   0  106M  0 part 
nvme0n1 259:0    0  375G  0 disk 
nvme0n2 259:1    0  375G  0 disk 
nvme0n3 259:2    0  375G  0 disk 
nvme0n4 259:3    0  375G  0 disk 
bob@caleston-lp10:~$

```

The message "lsblk: /proc/swaps: parse error at line 1 -- ignored" is an informational message indicating that
the ```lsblk``` command encountered an issue while trying to read the ```/proc/swaps``` file, which is used to gather information about active swap areas.
The error suggests that the file content was not in the expected format (e.g., corrupted or malformed),
so ```lsblk``` simply skipped that information and continued running. This error is likely a minor system configuration issue or a transient problem
and generally does not prevent the rest of the command from working correctly.  
Regarding your question about the number of block devices, there are 5 primary block devices present: 

- sda
- nvme0n1
- nvme0n2
- nvme0n3
- nvme0n4

The entries you mentioned: 
```
|-sda1    8:1    0 19.9G  0 part /dev/termination-log
|-sda14   8:14   0    4M  0 part 
`-sda15   8:15   0  106M  0 part
```

are partitions of the parent device . 
Think of it like this: 

• A **block device** is like a physical hard drive or SSD (, , etc.). 
• A **partition** is a section of that physical device (, , ). [6, 7, 8, 9, 10]  

The ```lsblk``` output uses a tree structure to show this relationship. The partitions are indented underneath their parent device.
You do not count the partitions as separate physical devices; they are components of a single device.


