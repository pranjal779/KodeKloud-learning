# Lab: Jenkins Jumpstart
<img width="1707" height="993" alt="image" src="https://github.com/user-attachments/assets/c08ff38e-676d-4379-9d68-d83a37de2302" />
<img width="2127" height="1043" alt="image" src="https://github.com/user-attachments/assets/f8e5e5e5-419b-47fd-bc66-74b2326d2325" />
<img width="1170" height="717" alt="image" src="https://github.com/user-attachments/assets/43874568-84f9-4fdb-a66b-7361f0428acb" />
<img width="1161" height="412" alt="image" src="https://github.com/user-attachments/assets/b9786006-2255-4abf-9e3e-4451dfb61d26" />

```txt
Continuous Delivery emphasizes the ability to release software frequently and reliably,
 but it doesn't necessarily mean every code change goes to production automatically.
 It involves a process of preparing software for release and ensuring it can be deployed to production at any time with minimal effort.
 Manual approval is a common gatekeeping mechanism in many Continuous Delivery implementations.
```

<img width="1147" height="733" alt="image" src="https://github.com/user-attachments/assets/2b94ce27-de29-4673-a2a8-631ff7447402" />
<img width="1211" height="818" alt="image" src="https://github.com/user-attachments/assets/8ae1610c-4571-47ac-81fc-e9669b6fa104" />
<img width="841" height="327" alt="image" src="https://github.com/user-attachments/assets/b96bb9f5-1ae2-42cb-86e3-9bce10ff094b" />
<img width="1147" height="505" alt="image" src="https://github.com/user-attachments/assets/3bee22c7-1f71-4196-b0e2-a1179ad51dc3" />
<img width="2508" height="972" alt="image" src="https://github.com/user-attachments/assets/796f6f16-0101-474b-a2c0-6132de37f2d3" />

```sh
bob@ubuntu-host ~ ✖ history
    1  whomai
    2  sudo apt update
    3  sudo apt install fontconfig openjdk-21-jre
    4  java -version
    5  sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc   https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    6  echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]"   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
    7  sudo apt update
    8  sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc   https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    9  echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]"   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
   10  sudo apt update
   11  sudo apt install jenkins
   12  clear
   13  hostory
   14  history

bob@ubuntu-host ~ ➜  
```

<img width="2508" height="972" alt="image" src="https://github.com/user-attachments/assets/b912e576-9659-4c24-944a-0e86495c402d" />

<img width="1173" height="528" alt="image" src="https://github.com/user-attachments/assets/eff9ee8f-c5df-4584-8ff1-39f2bd7013c3" />
<img width="2500" height="1272" alt="image" src="https://github.com/user-attachments/assets/e3736b22-fc80-428f-ae30-83d8a340d37a" />
<img width="1182" height="542" alt="image" src="https://github.com/user-attachments/assets/e7a993c9-e59c-4eaa-93ff-1bc2c1871ca3" />
<img width="2507" height="1350" alt="image" src="https://github.com/user-attachments/assets/c0caf9a2-073d-4e1a-82dd-fb4b0cd2cbfa" />
<img width="1455" height="705" alt="image" src="https://github.com/user-attachments/assets/8302c7ed-1b48-4bfc-88d4-1571841c2ca9" />
<img width="2388" height="745" alt="image" src="https://github.com/user-attachments/assets/685d70d3-d31f-44db-a5ca-d274cff3c350" />
<img width="1206" height="610" alt="image" src="https://github.com/user-attachments/assets/03505519-4328-45df-b9d4-63da1ce583fe" />
<img width="2387" height="738" alt="image" src="https://github.com/user-attachments/assets/d9832b5e-6e0c-4937-b980-beae80628348" />
<img width="973" height="303" alt="image" src="https://github.com/user-attachments/assets/ed91c367-98f0-44b4-a55a-3bbd307e929e" />
[Steps to install Jenkins in Ubuntu (linux)](https://www.jenkins.io/doc/book/installing/linux/#installation-of-java)

<img width="1132" height="682" alt="image" src="https://github.com/user-attachments/assets/f7199b69-ba79-45ab-9df2-f7eb3e1dfa52" />

```sh
Installing JDK:

sudo apt update
sudo apt install fontconfig openjdk-21-jre -y
java -version
Restarting Jenkins Service:

sudo systemctl restart jenkins
Check ifJenkins is in Active/Running state:

sudo systemctl status jenkins
```

```sh
bob@ubuntu-host ~ ➜  java -version
openjdk version "21.0.9" 2025-10-21
OpenJDK Runtime Environment (build 21.0.9+10-Ubuntu-122.04)
OpenJDK 64-Bit Server VM (build 21.0.9+10-Ubuntu-122.04, mixed mode, sharing)

bob@ubuntu-host ~ ➜  sudo systemctl enable jenkins
Synchronizing state of jenkins.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable jenkins

bob@ubuntu-host ~ ➜  sudo systemctl restart jenkins

bob@ubuntu-host ~ ➜  sudo systemctl status jenkins
● jenkins.service - Jenkins Continuous Integration Server
     Loaded: loaded (/lib/systemd/system/jenkins.service; enabled; vendor preset: enabled)
     Active: active (running) since Sun 2025-11-30 09:09:03 UTC; 20s ago
   Main PID: 248611 (java)
      Tasks: 45 (limit: 77143)
     Memory: 241.6M
     CGroup: /system.slice/jenkins.service
             └─248611 /usr/bin/java -Djava.awt.headless=true -jar /usr/share/java/jenkins.war --webroot=/var/cache/jenkins/war --httpPort=8081

Nov 30 09:08:59 ubuntu-host jenkins[248611]: [LF]>
Nov 30 09:08:59 ubuntu-host jenkins[248611]: [LF]> a15bc2fd45c143d3ae0744798757e682
Nov 30 09:08:59 ubuntu-host jenkins[248611]: [LF]>
Nov 30 09:08:59 ubuntu-host jenkins[248611]: [LF]> This may also be found at: /var/lib/jenkins/secrets/initialAdminPassword
Nov 30 09:08:59 ubuntu-host jenkins[248611]: [LF]>
Nov 30 09:08:59 ubuntu-host jenkins[248611]: [LF]> *************************************************************
Nov 30 09:08:59 ubuntu-host jenkins[248611]: [LF]> *************************************************************
Nov 30 09:08:59 ubuntu-host jenkins[248611]: [LF]> *************************************************************
Nov 30 09:09:03 ubuntu-host jenkins[248611]: 2025-11-30 09:09:03.567+0000 [id=43]        INFO        jenkins.InitReactorRunner$1#onAttained: Completed initialization
Nov 30 09:09:03 ubuntu-host jenkins[248611]: 2025-11-30 09:09:03.624+0000 [id=34]        INFO        hudson.lifecycle.Lifecycle#onReady: Jenkins is fully up and running

bob@ubuntu-host ~ ➜
```

<img width="2531" height="1350" alt="image" src="https://github.com/user-attachments/assets/e6633b2d-2f85-4bd4-810c-b52632523a5d" />
<img width="2512" height="1302" alt="image" src="https://github.com/user-attachments/assets/0d762ed3-9a33-4936-a390-1d4fc448e16b" />
<img width="1192" height="1168" alt="image" src="https://github.com/user-attachments/assets/0a190393-6523-4afa-ba35-75c1eec6b112" />
<img width="1340" height="881" alt="image" src="https://github.com/user-attachments/assets/a80cf9f7-defc-4f7e-a890-4153837c7c9e" />
<img width="1290" height="715" alt="image" src="https://github.com/user-attachments/assets/66947ffa-7690-4c59-bf6a-122c9f8f32c2" />
<img width="1065" height="182" alt="image" src="https://github.com/user-attachments/assets/0fc3dd3f-ce1b-4760-b9bb-58128c18b5da" />
<img width="1003" height="493" alt="image" src="https://github.com/user-attachments/assets/ffd367a8-02dc-4a3e-abe3-38fed6e091f1" />
<img width="1110" height="852" alt="image" src="https://github.com/user-attachments/assets/28314d95-7055-4965-8f1c-50236a7e884a" />
<img width="1142" height="1202" alt="image" src="https://github.com/user-attachments/assets/4868fcf4-47cf-4048-bf12-fb6376a0e9a9" />
<img width="1195" height="773" alt="image" src="https://github.com/user-attachments/assets/be8be5f7-ea78-4af4-aa02-800815978063" />
<img width="1195" height="773" alt="image" src="https://github.com/user-attachments/assets/618aa8fa-8f28-4bab-b038-f3c655095844" />
<img width="1172" height="752" alt="image" src="https://github.com/user-attachments/assets/b20f78bb-5fbe-4ea5-bbad-b131f4812bc5" />
<img width="1455" height="887" alt="image" src="https://github.com/user-attachments/assets/427a14a5-3e25-4754-865e-c31855e4484d" />
<img width="2530" height="1317" alt="image" src="https://github.com/user-attachments/assets/18aaa919-bb0f-4366-aafd-7c7283fa8429" />
<img width="1057" height="957" alt="image" src="https://github.com/user-attachments/assets/66967327-6c18-401b-a215-2329d4804c78" />
<img width="1202" height="1032" alt="image" src="https://github.com/user-attachments/assets/0235a587-93f1-418f-9501-04de922e20ed" />
<img width="1047" height="701" alt="image" src="https://github.com/user-attachments/assets/684b80b5-382b-41c4-b9a5-fd14f7d7f097" />
<img width="1240" height="1152" alt="image" src="https://github.com/user-attachments/assets/d26bf593-11d7-4b59-af3b-4704709dbc6f" />
<img width="1182" height="1242" alt="image" src="https://github.com/user-attachments/assets/78ff2ff6-104a-4d35-a952-b7ec9bb96db5" />
<img width="1133" height="985" alt="image" src="https://github.com/user-attachments/assets/fe93c467-51a8-4f5e-ae82-f2982b00f228" />

```sh
cat /var/lib/jenkins/workspace/lab1-build-ascii-generator/advice.json | jq -r .quote > ${WORKSPACE}/advice.message
[ $(wc -w < ${WORKSPACE}/advice.message) -gt 5 ] && echo "Advice has more than 5 words" || (echo "Advice - $(cat ${WORKSPACE}/advice.message) has 5 words or less" && exit 1)
# Mock Deploy
cat ${WORKSPACE}/advice.message | /usr/games/cowsay -f $(ls /usr/share/cowsay/cows | shuf -n 1)
```

<img width="1051" height="752" alt="image" src="https://github.com/user-attachments/assets/82d1bca8-3f6e-485e-b59b-bd54f8bebe5f" />
<img width="952" height="330" alt="image" src="https://github.com/user-attachments/assets/49aa6369-b64a-45b3-81b9-7d902317c1d5" />
<img width="1131" height="1290" alt="image" src="https://github.com/user-attachments/assets/1dc3dcee-a7dc-4ac4-837e-c6595b5f794f" />
<img width="1220" height="947" alt="image" src="https://github.com/user-attachments/assets/da87b6e7-2e76-4df5-b492-d6b9f71aab9b" />
<img width="1177" height="402" alt="image" src="https://github.com/user-attachments/assets/4c2756c1-9165-4c7d-a4ec-994bb6e46735" />
<img width="1067" height="1111" alt="image" src="https://github.com/user-attachments/assets/be055cea-a16b-4834-82d3-256221f29079" />
<img width="1158" height="1352" alt="image" src="https://github.com/user-attachments/assets/f3c4e1c5-0bdc-4611-b86f-44c21a219f22" />
<img width="1877" height="567" alt="image" src="https://github.com/user-attachments/assets/2a9cc88e-f97a-4c2e-b5b8-c0ffdfe802c9" />
<img width="1186" height="1032" alt="image" src="https://github.com/user-attachments/assets/4cf9821f-1409-4030-adf4-56460471cb7e" />

