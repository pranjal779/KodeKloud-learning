# Day 37: Copy File to Docker Container

[100 Days of DevOps | Docker | Day 35–47](https://medium.com/@niman.ransindu/100-days-of-devops-docker-day-35-47-d0af47e71d07)

<img width="857" height="295" alt="image" src="https://github.com/user-attachments/assets/6e75c2b1-0b97-450b-b078-82135230b838" />
<img width="686" height="312" alt="image" src="https://github.com/user-attachments/assets/aaa36d3d-4510-40a1-9e80-0ed7c50a6efc" />
<img width="2102" height="510" alt="image" src="https://github.com/user-attachments/assets/93980b9c-a904-48c6-b75d-97bc812dd98c" />

```sh
thor@jump-host ~$ ssh banner@stapp03
The authenticity of host 'stapp03 (10.244.221.66)' can't be established.
ED25519 key fingerprint is SHA256:Bn07GZEOs0+VQeT/HNjUb6/hJeZdkEP83biqbeQMNsI.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp03' (ED25519) to the list of known hosts.
banner@stapp03's password: 
[banner@stapp03 ~]$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
285c8d48844d   ubuntu    "/bin/bash"   3 minutes ago   Up 3 minutes             ubuntu_latest
[banner@stapp03 ~]$ docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/opt/
Successfully copied 2.05kB to ubuntu_latest:/opt/
[banner@stapp03 ~]$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
285c8d48844d   ubuntu    "/bin/bash"   7 minutes ago   Up 7 minutes             ubuntu_latest
[banner@stapp03 ~]$ docker exec 285c8d48844d tes -f /opt/nautilus.txt.gpg && echo "File exists" || "File NOT found"
OCI runtime exec failed: exec failed: unable to start container process: exec: "tes": executable file not found in $PATH: unknown
-bash: File NOT found: command not found
[banner@stapp03 ~]$ docker exec 285c8d48844d ls -l /opt/                           total 4
-rw-r--r-- 1 root root 105 May 13 06:21 nautilus.txt.gpg
[banner@stapp03 ~]$
```

```sh
[banner@stapp03 ~]$ history
    1  docker ps
    2  docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/opt/
    3  docker ps
    4  docker exec 285c8d48844d tes -f /opt/nautilus.txt.gpg && echo "File exists" || "File NOT found"
    5  docker exec 285c8d48844d ls -l /opt/
    6  history
[banner@stapp03 ~]$
```

<img width="2420" height="847" alt="image" src="https://github.com/user-attachments/assets/456401b3-ef19-4bc8-a0f2-b5d33353f902" />

<img width="2397" height="912" alt="image" src="https://github.com/user-attachments/assets/39070c67-e2eb-4e86-866e-134e3cf3f293" />
<img width="2417" height="880" alt="image" src="https://github.com/user-attachments/assets/c915810b-db3e-448e-9614-effaae755992" />



You actually did the task correctly. Your confusion is not about the task — it’s about understanding **what a container filesystem really is**. That’s a very normal Docker learning stage.

Let’s break it down properly.

---

# 🧠 What `docker cp` Actually Does

When you ran:

```bash
docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/opt/
```

Docker copied the file:

```text
FROM:
Host machine filesystem

TO:
Container filesystem
```

Meaning:

```text
Host:
/tmp/nautilus.txt.gpg

↓

Container:
/opt/nautilus.txt.gpg
```

So YES — after the command, the file actually exists **inside the container**.

---

# 🧱 Important Concept

A container has:

* its own filesystem
* its own processes
* its own environment

Think of it like:

```text
Mini isolated Linux machine
```

---

# 🧠 So where is the file now?

The file is NOT on:

```text
Host /opt/
```

It is inside:

```text
Container /opt/
```

These are different filesystems.

---

# ✅ Your verification using `ls -l` was CORRECT

You ran:

```bash
docker exec 285c8d48844d ls -l /opt/
```

And saw:

```text
nautilus.txt.gpg
```

That means:

✔ file exists inside container
✔ copy succeeded

---

# ❌ Why your earlier command failed

You typed:

```bash
docker exec 285c8d48844d tes -f /opt/nautilus.txt.gpg
```

The problem:

```text
tes
```

should have been:

```text
test
```

Linux has a command called:

```bash
test
```

not `tes`.

---

# ✅ Correct version would be

```bash
docker exec 285c8d48844d test -f /opt/nautilus.txt.gpg && echo "File exists" || echo "File NOT found"
```

This means:

| Part          | Meaning                      |   |            |
| ------------- | ---------------------------- | - | ---------- |
| `docker exec` | run command inside container |   |            |
| `test -f`     | check if file exists         |   |            |
| `&&`          | if success                   |   |            |
| `             |                              | ` | if failure |

---

# 🧠 Another Better Way (Very Important)

You can also directly enter the container:

```bash
docker exec -it ubuntu_latest bash
```

Now you are INSIDE the container:

```text
root@container:/#
```

Then you can:

```bash
cd /opt
ls -l
```

This is how most people inspect containers manually.

---

# 🧠 Important Docker Mental Model

Think like this:

```text
Host Machine
│
├── /tmp/nautilus.txt.gpg
│
└── Docker Container
      └── /opt/nautilus.txt.gpg
```

Different environments.

---

# 🔐 "Ensure the file is not modified"

This line in the task mainly means:

👉 don’t decrypt
👉 don’t edit
👉 don’t rename
👉 don’t change content

`docker cp` preserves the file content.

So you already satisfied this requirement.

---

# 🚀 Best Verification Commands (Professional Ways)

## Method 1 — Check existence

```bash
docker exec ubuntu_latest test -f /opt/nautilus.txt.gpg && echo "Exists"
```

---

## Method 2 — List directory

```bash
docker exec ubuntu_latest ls -l /opt/
```

---

## Method 3 — Compare checksum (ADVANCED / VERY GOOD)

This is the most professional way.

On host:

```bash
sha256sum /tmp/nautilus.txt.gpg
```

Inside container:

```bash
docker exec ubuntu_latest sha256sum /opt/nautilus.txt.gpg
```

If hashes match:

✔ file unchanged
✔ integrity maintained

This is how professionals verify secure transfers.

---

# 🧠 Biggest Thing You Should Learn Here

This task teaches:

* container filesystem isolation
* copying data between host and container
* running commands inside containers
* basic container inspection

These are foundational Docker concepts.

---

# 👊 Honest advice

You’re learning correctly.

The important thing is:

👉 you noticed you didn’t fully understand
👉 you asked WHY
👉 not just “task completed”

That’s how real understanding develops.

Most people stop at:

```bash
docker cp worked → done
```

You asked:

> “Where did the file actually go?”



------------


Excellent question. This is the exact point where Docker “clicks” for many people.

You **cannot directly `cd` into a container filesystem from the host shell** like a normal directory.

You must first **enter the container**.

---

# ✅ Correct Way to Navigate to the File Inside Container

You have a container:

```text
ubuntu_latest
```

So enter it using:

```bash
docker exec -it ubuntu_latest bash
```

---

# 🧠 What this command means

| Part            | Meaning                      |
| --------------- | ---------------------------- |
| `docker exec`   | run command inside container |
| `-it`           | interactive terminal         |
| `ubuntu_latest` | container name               |
| `bash`          | start bash shell             |

---

# 🔥 After Running It

You’ll see something like:

```bash
root@285c8d48844d:/#
```

NOW you are inside the container shell.

At this point:

```bash
cd /opt
ls -l
```

And you should see:

```text
nautilus.txt.gpg
```

---

# 🚀 Full Example

```bash
docker exec -it ubuntu_latest bash

cd /opt

ls -l
```

Output:

```text
-rw-r--r-- 1 root root 105 May 13 06:21 nautilus.txt.gpg
```

---

# 🧠 Important Concept

When you enter:

```bash
docker exec -it ubuntu_latest bash
```

You are basically entering:

```text
Mini Linux OS inside container
```

with its own:

* filesystem
* processes
* directories

---

# ❌ Why You Couldn't Just Use Normal `cd`

From the host machine:

```bash
cd /opt
```

takes you to:

```text
HOST /opt
```

NOT container `/opt`.

Because:

```text
Host filesystem ≠ Container filesystem
```

They are isolated.

---

# 🔍 Quick Mental Visualization

```text
Host Machine
│
├── /tmp/nautilus.txt.gpg
│
└── Container: ubuntu_latest
      │
      └── /opt/nautilus.txt.gpg
```

Different environments.

---

# ✅ Fast One-Line Verification

Instead of entering container manually, you can directly run:

```bash
docker exec ubuntu_latest ls -l /opt/
```

This says:

```text
Run ls -l /opt/ INSIDE the container
```

without opening an interactive shell.

---

# 🧠 Difference Between `docker exec` and `docker cp`

| Command       | Purpose                       |
| ------------- | ----------------------------- |
| `docker cp`   | copy files                    |
| `docker exec` | run commands inside container |

---

# 👊 Best Practice (Important)

When learning Docker, always think:

```text
Host OS
↓
Docker Engine
↓
Containers (isolated mini environments)
```

That mental model will help you later with:

* Kubernetes
* volumes
* networking
* persistent storage

---

# 🔥 Pro Tip

You can also inspect container filesystem structure like this:

```bash
docker exec -it ubuntu_latest bash
```

Then:

```bash
pwd
whoami
ls /
```

This helps you understand:

* container filesystem layout
* installed tools
* running environment

That’s how people really learn containers deeply.


----------------

```sh
thor@jump-host ~$ ssh banner@stapp03
The authenticity of host 'stapp03 (10.244.30.32)' can't be established.
ED25519 key fingerprint is SHA256:6MJQxvHZkn2myRn7t9TSWTsQsi6YX6cES85iv1fxqK8.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'stapp03' (ED25519) to the list of known hosts.
banner@stapp03's password: 
[banner@stapp03 ~]$ docker PS
docker: 'PS' is not a docker command.
See 'docker --help'
[banner@stapp03 ~]$ docker ps
CONTAINER ID   IMAGE     COMMAND       CREATED              STATUS              PORTS     NAMES
8276c5d48d29   ubuntu    "/bin/bash"   About a minute ago   Up About a minute             ubuntu_latest
[banner@stapp03 ~]$ docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/opt/
Successfully copied 2.05kB to ubuntu_latest:/opt/
[banner@stapp03 ~]$ docker exec 8276c5d48d29 test -f /opt/nautilus.txt.gpg && echo "File exist" || "File NOT found"
File exist
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ docker exec 8276c5d48d29 ls -l /opt/
total 4
-rw-r--r-- 1 root root 105 May 13 07:00 nautilus.txt.gpg
[banner@stapp03 ~]$ 
[banner@stapp03 ~]$ docker exec -it ubuntu_latest bash
root@8276c5d48d29:/# cd /opt
root@8276c5d48d29:/opt# ls -l
total 4
-rw-r--r-- 1 root root 105 May 13 07:00 nautilus.txt.gpg
root@8276c5d48d29:/opt# 
```

<img width="2382" height="1166" alt="image" src="https://github.com/user-attachments/assets/dced9e93-1bb7-4fed-869c-638dae9075b2" />
<img width="2330" height="1165" alt="image" src="https://github.com/user-attachments/assets/1680880c-a252-4461-a0d3-2d2f2b361741" />
