# Creating a SYSTEMD Service

# SYSTEMD and Service Management
## The Linux Basics Course

### SYSTEMD and Services

- Create your own SYSTEMD service
- SYSTEMD Tools
- LABS: SYSTEMD

<img width="1892" height="1335" alt="image" src="https://github.com/user-attachments/assets/76c51621-7385-4609-b4eb-f7eb1db6e54a" />

## Create a Service Unit File

<img width="2082" height="1137" alt="image" src="https://github.com/user-attachments/assets/f949310f-e2ec-401d-804d-6e05efca0ae2" />

## To allow this service to be enabled during boot, add another section called install

<img width="1798" height="1162" alt="image" src="https://github.com/user-attachments/assets/24d2ec50-0916-4584-894d-fd4f89587c48" />

- **graphical mode set it by graphical.target**

- **Setting User?**
<img width="1932" height="1153" alt="image" src="https://github.com/user-attachments/assets/1099ae63-9faf-468a-99b5-bd1ca9cf6514" />

- **Restart Directive**
<img width="1908" height="1140" alt="image" src="https://github.com/user-attachments/assets/e0ec3791-27b8-4f67-b0d5-b25b2eb33634" />

- **Restart interval 10 Seconds**
<img width="1872" height="1122" alt="image" src="https://github.com/user-attachments/assets/a851abaf-d63a-47ee-a69f-ec8bf3f843ff" />

- **with SYSTEMD it is automatically logged, so this requirement is automatically taken care of without any additional configuration.**
<img width="1882" height="1140" alt="image" src="https://github.com/user-attachments/assets/1c2dc765-0fa7-44e2-ba3e-facb42db0d9e" />

- **Unit head for the file**
- **Has Description, Documentation, After...**
<img width="1926" height="1145" alt="image" src="https://github.com/user-attachments/assets/e49271ff-54e2-427e-99c5-c1d054e45ef8" />

- <img width="1991" height="1187" alt="image" src="https://github.com/user-attachments/assets/7b797f13-d063-48a7-a8b5-c24a2d387f14" />

<img width="1991" height="1187" alt="image" src="https://github.com/user-attachments/assets/eecfc3c9-c313-497a-b2eb-a867ce11c30a" />


# SYSTEMD TOOLS

## SYSTEMCTL
## JOURNALCTL

<img width="1987" height="1213" alt="image" src="https://github.com/user-attachments/assets/be7e99be-59cf-4786-a8d7-5e3384e57954" />


## Service Management with SYSTEMD

<img width="2047" height="1152" alt="image" src="https://github.com/user-attachments/assets/6d4054ee-b96f-4295-bb71-c695a2cd5c95" />


```sh
systemctl start docker
systemctl stop docker
systemctl restart docker
systemctl reload docker
systemctl enable docker
systemctl disable docker
systemctl status docker
```

|State | Meaning|
|:---|:---|
|Active|Service Running|
|Inactive|Service Stopped|
|Failed|Crashed/Error/Timeout e.t.c|

## SERVICE MANAGEMENT WITH SYSTEMD

<img width="1742" height="813" alt="image" src="https://github.com/user-attachments/assets/56ac3f89-0ac2-4e4c-9f3e-372d38998037" />


```sh
systemctl daemon-reload
systemctl edit project-mercury.service --full
```

## SYStemctl To Manage State
<img width="1997" height="1016" alt="image" src="https://github.com/user-attachments/assets/776af955-7027-49cc-a035-b612cd3d7818" />

```sh
systemctl get-default
systemctl set-default multi-user.target
systemctl list-units --all
systemctl list-units
```

## JOURNALCTL
<img width="2022" height="922" alt="image" src="https://github.com/user-attachments/assets/6d703cdf-349c-4dd4-bf8f-8d9d478807ce" />


```sh
journalctl
journalctl -b
journalctl -u UNIT
journalctl -u docker.service
```
