# Lab - Authentication-Encryption

<img width="988" height="1087" alt="image" src="https://github.com/user-attachments/assets/4cd334d8-f58f-4206-bb59-f2b572a29cf0" />
<img width="1010" height="1072" alt="image" src="https://github.com/user-attachments/assets/0d3a3551-df9b-4b3d-978c-521cb8145b3a" />

```sh
root@prometheus-server ~ ➜  mkdir node_exporter

root@prometheus-server ~ ➜  mkdir node_exporter/config.yml

root@prometheus-server ~ ➜  rm -rf node_exporter/config.yml

root@prometheus-server ~ ➜  ls
node_exporter

root@prometheus-server ~ ➜  rm -rf node_exporter/

root@prometheus-server ~ ➜  mkdir /etc/node_exporter/

root@prometheus-server ~ ➜  mkdir /etc/node_exporter/config.yml

root@prometheus-server ~ ➜  rm -rf /etc/node_exporter/config.yml

root@prometheus-server ~ ➜  ls /etc/node_exporter/

root@prometheus-server ~ ➜  touch /etc/node_exporter/config.yml

root@prometheus-server ~ ➜  chmod 700 /etc/node_exporter

root@prometheus-server ~ ➜  chmod 600 /etc/node_exporter/config.yml

root@prometheus-server ~ ➜  

root@prometheus-server ~ ➜  chown -R node_exporter:node_exporter /etc/node_exporter
chown: invalid user: ‘node_exporter:node_exporter’

root@prometheus-server ~ ✖ chmod 600 /etc/node_exporter/config.yml

root@prometheus-server ~ ➜  chown -R node_exporter:node_exporter /etc/node_exporter
chown: invalid user: ‘node_exporter:node_exporter’

root@prometheus-server ~ ✖ cd /etc/
root@prometheus-server /etc ➜  chown -R node_exporter:node_exporter /etc/node_exporter
chown: invalid user: ‘node_exporter:node_exporter’

root@prometheus-server /etc ✖ groupadd --system node_exporter

root@prometheus-server /etc ➜  useradd -s /sbin/nologin --system -g node_exporter node_exporter

root@prometheus-server /etc ➜  id node_exporter
uid=999(node_exporter) gid=997(node_exporter) groups=997(node_exporter)

root@prometheus-server /etc ➜
root@prometheus-server /etc ➜  chown -R node_exporter:node_exporter /etc/node_exporter

root@prometheus-server /etc ➜

root@prometheus-server /etc/systemd/system ➜  ssh root@node01
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 6.8.0-1047-gcp x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.

root@node01 ~ ➜  mkdir /etc/node_exporter/

root@node01 ~ ➜  touch /etc/node_exporter/config.yml

root@node01 ~ ➜  chmod 700 /etc/node_exporter

root@node01 ~ ➜  chmod 600 /etc/node_exporter/config.yml

root@node01 ~ ➜  chown -R node_exporter:node_exporter /etc/node_exporter

root@node01 ~ ➜  vi /etc/systemd/system/node_exporter.service

root@node01 ~ ➜  



[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter --web.config.file=/etc/node_exporter/config.yml

[Install]
WantedBy=multi-user.target

root@prometheus-server /etc/systemd/system ➜  ssh root@node02
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 6.8.0-1047-gcp x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

This system has been minimized by removing packages and content that are
not required on a system that users do not log into.

To restore this content, you can run the 'unminimize' command.

root@node02 ~ ➜  mkdir /etc/node_exporter/

root@node02 ~ ➜  touch /etc/node_exporter/config.yml

root@node02 ~ ➜  chmod 700 /etc/node_exporter

root@node02 ~ ➜  chmod 600 /etc/node_exporter/config.yml

root@node02 ~ ➜  chown -R node_exporter:node_exporter /etc/node_exporter

root@node02 ~ ➜  vi /etc/systemd/system/node_exporter.service

root@node02 ~ ➜



[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter --web.config.file=/etc/node_exporter/config.yml

[Install]
WantedBy=multi-user.target

root@node02 ~ ✖ systemctl daemon-reload

root@node02 ~ ➜  systemctl restart node_exporter

root@node02 ~ ➜  exit

```

<img width="1213" height="1045" alt="image" src="https://github.com/user-attachments/assets/2a99f474-c533-42ec-b16f-b2ff4067e3ee" />
<img width="2202" height="1191" alt="image" src="https://github.com/user-attachments/assets/991c3f4f-5ae8-4e3c-946d-bfc11143ab37" />

<img width="2115" height="1183" alt="image" src="https://github.com/user-attachments/assets/28743d98-40e8-491a-b213-67b13a5f423e" />

<img width="2005" height="1103" alt="image" src="https://github.com/user-attachments/assets/a0c59735-91c3-4f6c-8f96-2f5b8a726239" />
<img width="2100" height="1202" alt="image" src="https://github.com/user-attachments/assets/043a6f39-bd74-4fb7-8162-a61fb12ed55d" />

<img width="1010" height="932" alt="image" src="https://github.com/user-attachments/assets/a6c590f4-859f-434f-bb3c-188ce832980c" />

<img width="2268" height="1168" alt="image" src="https://github.com/user-attachments/assets/5f67e7de-24e8-4ab1-8771-32643dd6b350" />
<img width="2277" height="1192" alt="image" src="https://github.com/user-attachments/assets/c730cdfd-d7d6-4fa4-a8ce-674c600acdaa" />
<img width="2373" height="1082" alt="image" src="https://github.com/user-attachments/assets/d94ef02c-bdab-4e39-b73b-4844a4023e4c" />

<img width="1992" height="1177" alt="image" src="https://github.com/user-attachments/assets/b817813e-f98e-4796-b9fc-290730e2cee9" />
<img width="2358" height="1165" alt="image" src="https://github.com/user-attachments/assets/fc66aeda-927e-4e33-a05b-2b5a4955adad" />
<img width="2362" height="1218" alt="image" src="https://github.com/user-attachments/assets/f794c731-8984-46a7-a54b-ade621cfedba" />

<img width="981" height="620" alt="image" src="https://github.com/user-attachments/assets/acb55375-cf43-4ea3-aa47-d93feb355b40" />


<img width="2378" height="685" alt="image" src="https://github.com/user-attachments/assets/356a6eb3-123c-4032-899b-04eea1dde664" />
<img width="2325" height="702" alt="image" src="https://github.com/user-attachments/assets/228b2f8f-e3f1-44c5-8894-efa56ecb9182" />
<img width="977" height="702" alt="image" src="https://github.com/user-attachments/assets/a8895b53-b512-4098-a416-5b3e7183e4eb" />
<img width="977" height="702" alt="image" src="https://github.com/user-attachments/assets/042a049b-63d0-4a24-81d0-4ac405d21f8d" />
<img width="2527" height="977" alt="image" src="https://github.com/user-attachments/assets/1a160971-11b4-4dc6-b03a-64ba1467ce23" />
<img width="996" height="292" alt="image" src="https://github.com/user-attachments/assets/aca6be76-ebcb-4aac-9974-ed3f80907131" />
<img width="983" height="676" alt="image" src="https://github.com/user-attachments/assets/284563f2-4e30-458a-aad6-81f27c83b67f" />
<img width="1033" height="577" alt="image" src="https://github.com/user-attachments/assets/fe7c7bb7-c670-4417-a18a-180110052cca" />
<img width="1046" height="650" alt="image" src="https://github.com/user-attachments/assets/a791e9a8-768c-40af-807c-49f011792342" />
<img width="2227" height="1168" alt="image" src="https://github.com/user-attachments/assets/324d762d-055b-4b3d-a12f-385e79e1aa0e" />
<img width="2242" height="1196" alt="image" src="https://github.com/user-attachments/assets/a2486055-fdc2-48a3-834b-12d588c5f77f" />
<img width="2252" height="1207" alt="image" src="https://github.com/user-attachments/assets/478bb78d-2a60-4fc3-ab2c-26c69e60f9ff" />
<img width="2222" height="1172" alt="image" src="https://github.com/user-attachments/assets/9b9f0ca4-c9a2-4da4-8ae0-a717297869f9" />
<img width="992" height="840" alt="image" src="https://github.com/user-attachments/assets/9073ad21-c6b2-40cc-aa13-45a882c09baa" />
<img width="1020" height="1285" alt="image" src="https://github.com/user-attachments/assets/0e12c33c-4e30-4cbd-9035-adae085674f8" />
<img width="1046" height="737" alt="image" src="https://github.com/user-attachments/assets/970c035f-06f1-42f6-808a-36ce32b87857" />
<img width="1021" height="360" alt="image" src="https://github.com/user-attachments/assets/dfdf1d76-1248-40bd-9dee-34d8e32fd23a" />
<img width="1047" height="817" alt="image" src="https://github.com/user-attachments/assets/c0eeb9ca-0e1e-409e-8aed-e6123aa07523" />
<img width="975" height="772" alt="image" src="https://github.com/user-attachments/assets/d836cab3-c2c9-4ba5-a82c-479cc0d756b0" />
<img width="1021" height="841" alt="image" src="https://github.com/user-attachments/assets/014eed96-be23-4aa8-bb19-82cb7a449011" />
<img width="996" height="530" alt="image" src="https://github.com/user-attachments/assets/195b3ea6-1658-46e2-af8f-ba2784154508" />





















