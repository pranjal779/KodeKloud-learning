```
The Nautilus development team had a meeting with the DevOps team where they discussed automating the deployment of one of their apps using Jenkins (the one in Stratos Datacenter). They want to auto deploy the new changes in case any developer pushes to the repository. As per the requirements mentioned below configure the required Jenkins job.

Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and Adm!n321 password.

Similarly, you can access the Gitea UI using Gitea button. Username and password for Git are sarah and Sarah_pass123. Under user sarah you will find a repository named web that is already cloned on App Server 1 under sarah's home (/home/sarah/web). sarah is a developer who is working on this repository.

httpd is already installed and configured on the app server (listening on port 8080). Ensure the httpd service is running on App Server 1 (e.g. start it manually if needed). You can make starting/restarting httpd part of your Jenkins job if you prefer.

Create a Jenkins job named xfusion-app-deployment and configure it so that if anyone pushes any new change to the origin repository in master branch, the job should auto build and deploy the latest code on App Server 1 under /var/www/html directory. Before deployment, ensure that the ownership of the /var/www/html directory is set to user sarah, so that Jenkins can successfully deploy files to that directory.

SSH into App Server 1 using sarah user credentials mentioned above. Under sarah user's home (/home/sarah/web) you will find a cloned Git repository named web. Under this repository there is an index.html file, update its content to Welcome to the xFusionCorp Industries, then push the changes to the origin into master branch. This push must trigger your Jenkins job and the latest changes must be deployed on the server, also make sure it deploys the entire repository content not only index.html file.

Click on the App button on the top bar to access the app. Please make sure the required content is loading on the main URL (e.g. http://stlb01:8091) i.e there should not be any sub-directory like http://stlb01:8091/web etc.

Note:

You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also some times Jenkins UI gets stuck when Jenkins service restarts in the back end so in such case please make sure to refresh the UI page.

Make sure Jenkins job passes even on repetitive runs as validation may try to build the job multiple times.

Deployment related tasks should be done by sudo user on the destination server to avoid any permission issues so make sure to configure your Jenkins job accordingly.

For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.

can you help with the Day 79 Jenkins Deployment Job Task?

I am failing this task
I have seen multiple Youtube Video solutions and read multiple solution posts like in medium and dev community posts

look at my workflow and tell me what I am missing

first I open jenkins
install plugin: Git, Credentials
add a credential for sara user-> username: sarah, id: sara, password: Sarah_pass123
creates jenkins Job: xfusion-app-deployment -> freestyle
in the terminal logs into sarah using ssh sarah@stapp01 and password Sarah_pass123
checks if http server is running or not using sudo systemctl status httpd

[sarah@stapp01 ~]$ ls -la /home/sarah/web
total 16
drwxr-xr-x 3 sarah sarah 4096 Jul  4 12:08 .
drwx------ 1 sarah sarah 4096 Jul  4 12:08 ..
drwxr-xr-x 7 sarah sarah 4096 Jul  4 12:08 .git
-rw-r--r-- 1 sarah sarah   21 Jul  4 12:08 index.html
[sarah@stapp01 ~]$ sudo systemctl status httpd

[sarah@stapp01 ~]$ ls -ld /var/www/html
drwxr-xr-x 1 sarah sarah 4096 Jul  4 12:08 /var/www/html
[sarah@stapp01 ~]$ cat /var/www/html/index.html 
Welcome to KodeKloud
[sarah@stapp01 ~]$ ls
web
[sarah@stapp01 ~]$ cd /home/sarah/web/
[sarah@stapp01 web]$ ls
index.html
[sarah@stapp01 web]$ cat index.html 
Welcome to KodeKloud
[sarah@stapp01 web]$

while configuring the Job
I selected the Git in SOurce Code Management
provided the url of the repo https://3000-port-2meq7dsvira7xkna.labs.kodekloud.com/sarah/web.git

in the Build Steps: Execute shell:
sshpass -p Sarah_pass123 scp -o StrictHostKeyChecking=no -r * sarah@stapp01:/var/www/html

using vi index.html
changes to content to Welcome to the xFusionCorp Industries

[sarah@stapp01 web]$ git status
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   index.html

no changes added to commit (use "git add" and/or "git commit -a")
[sarah@stapp01 web]$


[sarah@stapp01 web]$ git add .
[sarah@stapp01 web]$ git commit -m "update for index.html"
[master a805c22] update for index.html
 1 file changed, 1 insertion(+), 1 deletion(-)
[sarah@stapp01 web]$ git remote -v
origin  http://sarah:Sarah_pass123@gitea:3000/sarah/web.git (fetch)
origin  http://sarah:Sarah_pass123@gitea:3000/sarah/web.git (push)
[sarah@stapp01 web]$

[sarah@stapp01 web]$ git push origin master
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Writing objects: 100% (3/3), 291 bytes | 291.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
remote: . Processing 1 references
remote: Processed 1 references in total
To http://gitea:3000/sarah/web.git
   c3b29ec..a805c22  master -> master
[sarah@stapp01 web]$ 



[sarah@stapp01 web]$ cd /var/www/html
[sarah@stapp01 html]$ ls
index.html
[sarah@stapp01 html]$ cat index.html 
Welcome to the xFusionCorp Industries
[sarah@stapp01 html]$ cat /home/sarah/web/index.html 
Welcome to the xFusionCorp Industries
[sarah@stapp01 html]$ sudo systemctl restart httpd
[sudo] password for sarah: 
[sarah@stapp01 html]$ cat index.html 
Welcome to the xFusionCorp Industries
[sarah@stapp01 html]$ cat /home/sarah/web/index.html 
Welcome to the xFusionCorp Industries
[sarah@stapp01 html]$


and the build was successfull still I was getting: Validation file not on LB. Check webhook triggers the job and job deploys to
/var/www/html.


what I should have done  what am I missing?

```

this is one of those KodeKloud tasks where **the wording matters more than the commands**. I think I know exactly why you failed.

Let's think like the KodeKloud validator.

---

# First, what is the validator checking?

The validator is **not** checking:

> Can Pranjal manually copy files?

It is checking:

> If a developer pushes to Gitea, does Jenkins automatically deploy the latest code?

Those are two very different things.

---

# I immediately noticed the biggest thing missing

You wrote:

> using `git push origin master`

Then you said:

> Build was successful

But the validator says:

```
Validation file not on LB.
Check webhook triggers the job and job deploys to /var/www/html.
```

Notice the keyword:

> **webhook triggers the job**

That is the clue.

---

# Mistake #1 — No Build Trigger

Did you configure **Build Triggers**?

Specifically something like

```
GitHub hook trigger for GITScm polling
```

or

```
Poll SCM
```

or

```
Build when a change is pushed to Gitea
```

depending on the plugins installed?

The task literally says

> if anyone pushes any new change...

That means Jenkins must automatically start.

If you clicked **Build Now**, you'll pass your own test but fail KodeKloud.

---

# Mistake #2 — Jenkins is cloning the repo

You configured

```
Source Code Management
Git
Repository URL
```

Good.

Then in Execute Shell you did

```bash
scp -r * sarah@stapp01:/var/www/html
```

This only copies Jenkins' workspace.

That's okay.

But...

---

# Mistake #3 — Did Jenkins actually clone after the push?

Look at the build log.

Do you see

```
Fetching changes from Git repository

Checking out Revision ...

```

?

If you don't...

then Jenkins never detected the push.

---

# Mistake #4 — The task never asks you to SSH inside the build

Notice something?

The repository already exists here

```
/home/sarah/web
```

That repository belongs to Sarah.

But Jenkins has its **own workspace**.

The deployment should be

```
Gitea

↓

Jenkins clones latest

↓

workspace

↓

copies workspace

↓

/var/www/html
```

NOT

```
Sarah edits

↓

scp

↓

/var/www/html
```

---

# Mistake #5 — You may have skipped "Clean before checkout"

Suppose Jenkins cloned yesterday.

Today you changed

```
index.html
```

If Jenkins workspace is stale...

it may still deploy yesterday's version.

Usually Freestyle Jobs use

```
Additional Behaviours

↓

Clean before checkout
```

or

```
Wipe Workspace
```

---

# Mistake #6 — Webhook

This one catches MANY people.

Did you configure Gitea webhook?

Something like

```
Repository

↓

Settings

↓

Webhooks

↓

Jenkins
```

or

```
http://jenkins:8080/github-webhook/
```

or

```
http://jenkins:8080/gitea-webhook/
```

depending on plugin.

Some KodeKloud labs expect this.

Others don't.

The validator mentioning

```
Check webhook triggers the job
```

makes me think yours **does**.

---

# Mistake #7 — Your deployment command

You wrote

```bash
scp -r * sarah@stapp01:/var/www/html
```

Notice something?

Suppose your repo contains

```
.gitignore

css/

js/

index.html
```

Will

```
*
```

copy hidden files?

No.

Will it copy `.git`?

No.

That isn't necessarily wrong...

but many solutions use

```bash
cp -rf ./* /var/www/html/
```

because Jenkins is already running on the agent.

No need for SSH.

---

# Wait...

I think I found the BIGGEST issue.

Look carefully.

The task says

> Add Agent

No.

Actually...

It DOESN'T.

Unlike Day 77.

There is **NO agent creation**.

Instead

```
SSH

↓

Sarah

↓

App Server
```

is only for editing.

Jenkins itself may already be running on App Server 1.

Or Jenkins executes locally.

---

# Another clue

You wrote

```bash
scp
```

Why?

The job is already running on App Server 1 if configured correctly.

You could simply do

```bash
cp -r * /var/www/html/
```

No network transfer needed.

---

# Even bigger clue

The validator says

```
Validation file not on LB
```

That usually means

```
Push

↓

Job didn't run

↓

Old page still on LB
```

NOT

```
Copy failed
```

---

# Here's how I would solve it

I would configure

## Source Code Management

Git

↓

Repository URL

↓

Credentials

---

## Build Trigger

**Poll SCM**

or

**Build when pushed**

(depending on installed plugins)

---

## Execute Shell

Something like

```bash
sudo chown -R sarah:sarah /var/www/html

cp -rf * /var/www/html/

sudo systemctl restart httpd
```

Notice

No sshpass.

No scp.

No SSH.

---

Then

SSH as Sarah

```
cd ~/web

vi index.html

git add .

git commit

git push
```

Then

**DO NOT CLICK BUILD NOW**

Wait.

If Jenkins starts itself,

you've configured it correctly.

---

# My suspicion (90%)

I think you manually built the job.

The validator expected

```
git push

↓

Webhook

↓

Jenkins starts automatically

↓

Deploy

↓

LB updated
```

instead of

```
git push

↓

Build Now

↓

Deploy
```

---

## One thing I'd like to see

Can you paste **the entire Jenkins build log** from **Console Output**?

Not just the last few lines.

I want to see whether Jenkins actually performed:

1. Git checkout
2. Trigger source (manual vs webhook)
3. Workspace location
4. Copy step
5. Restart httpd

From what you've described, I think the failure is **not** in your shell commands—it's in **how Jenkins is being triggered**. That "Validation file not on LB. Check webhook triggers the job..." message is the biggest clue.

---


Excellent! This console log is actually **the smoking gun**. There are a couple of clues that explain why the validator failed.

---

# ✅ First, the good news

This line proves the webhook/Poll SCM worked:

```text
Started by an SCM change
```

So your suspicion about Poll SCM was **not** the problem.

It means:

```
Git Push
      ↓
Jenkins detected change
      ↓
Job started automatically
```

So you've already solved one of the hardest parts of the task.

---

# Jenkins successfully checked out the latest commit

Look here:

```text
Checking out Revision
a805c225401d5fade25bcffe5f6263567383b14a
```

and

```text
Commit message:
"update for index.html"
```

Perfect.

That means Jenkins pulled the newest code.

---

# Now the important clue

Look carefully at your copy command.

It says

```text
scp ... index.html ...
```

Only **one file**.

The task explicitly says:

> **make sure it deploys the entire repository content not only index.html file.**

That sentence is there because the validator checks for it.

---

Suppose tomorrow the repo becomes

```
web/

index.html
style.css
script.js
images/
logo.png
```

Your job copies only

```
index.html
```

Everything else is missing.

---

Most solutions instead use

```bash
cp -r * /var/www/html/
```

or

```bash
cp -rf ./* /var/www/html/
```

or

```bash
rsync -av ./ /var/www/html/
```

because that copies the **entire repository**.

---

# Second clue

Your workspace is

```
/var/lib/jenkins/workspace/xfusion-app-deployment
```

That means Jenkins already has all the files.

You don't actually need

```
scp
```

unless Jenkins is running on a different machine.

If Jenkins and App Server are different, `scp` is okay—but it still needs to copy the **whole repository**, not just `index.html`.

---

# Third clue (possibly the real validator failure)

The task says

> Before deployment, ensure that the ownership of `/var/www/html` is set to user **sarah**

Did your build step do this?

I don't see anything like

```bash
sudo chown -R sarah:sarah /var/www/html
```

in the console log.

Maybe you manually did it before.

The validator wants the **job** to be able to run repeatedly.

---

# Fourth clue

This line:

```
scp ... /var/www/html
```

Notice there is **no trailing slash**.

Usually I'd write

```bash
scp -r * sarah@stapp01:/var/www/html/
```

or

```bash
scp -r ./* sarah@stapp01:/var/www/html/
```

to avoid ambiguity.

---

# If I were writing this job

The Execute Shell would look more like

```bash
sudo chown -R sarah:sarah /var/www/html

cp -rf * /var/www/html/

sudo systemctl restart httpd
```

or, if Jenkins is on another server,

```bash
sshpass -p Sarah_pass123 ssh -o StrictHostKeyChecking=no sarah@stapp01 \
"sudo chown -R sarah:sarah /var/www/html"

sshpass -p Sarah_pass123 scp -o StrictHostKeyChecking=no -r ./* \
sarah@stapp01:/var/www/html/

sshpass -p Sarah_pass123 ssh -o StrictHostKeyChecking=no sarah@stapp01 \
"sudo systemctl restart httpd"
```

Notice:

* ownership handled by the job
* **entire repository** copied
* restart httpd
* no manual intervention

---

# The biggest thing I think KodeKloud didn't like

From everything you've shown, I'd rank the likely causes:

### ⭐⭐⭐⭐⭐ #1

You copied only

```text
index.html
```

instead of

```text
entire repository
```

---

### ⭐⭐⭐⭐ #2

No

```bash
sudo chown -R sarah:sarah /var/www/html
```

inside the Jenkins job.

---

### ⭐⭐⭐ #3

If Jenkins is on App Server 1, using `scp` is unnecessary; a local `cp` is simpler and less error-prone.

---

## One thing in your console log that caught my eye

This line:

```text
scp ... sarah@stappe1:/var/www/html
```

Notice the hostname appears as:

```
stappe1
```

instead of

```
stapp01
```

That may just be a formatting issue from copying the log, but if you actually configured `stappe1` anywhere instead of `stapp01`, that's another thing to verify.

---

### One final question

Can you tell me:

**Was Jenkins running on the `jenkins` server, or did you create an SSH agent on `stapp01` for this task?**

The answer changes what the ideal deployment command should be, and I can show you the cleanest solution based on that architecture.

---

i did not had sudo chown -R sarah:sarah /var/www/html in the build step
also I noticed my command was: sshpass -p Sarah_pass123 scp -o StrictHostKeyChecking=no -r * sarah@stapp01:/var/www/html

and in the console log: + sshpass -p Sarah_pass123 scp-o StrictHostKeyChecking=no -r index.html sarah@stapp01:/var/www/html

no * after -r

I am not sure about this: Was Jenkins running on the jenkins server, or did you create an SSH agent on stapp01 for this task? tell me how do I check this?

---

You're getting very close, Pranjal. In fact, I think you're starting to think like a DevOps engineer instead of just trying to make the validator happy. Let's answer your questions one by one.

---

# 1. Why did the `*` disappear in the Jenkins console log?

You wrote:

```bash
sshpass -p Sarah_pass123 scp -o StrictHostKeyChecking=no -r * sarah@stapp01:/var/www/html
```

But Jenkins showed:

```bash
scp -r index.html ...
```

This is actually **normal Linux shell behavior**.

Before `scp` is executed, the shell expands `*`.

Suppose your Jenkins workspace contains only:

```
workspace/
└── index.html
```

Then

```bash
scp -r *
```

becomes

```bash
scp -r index.html
```

The shell replaces `*` with the matching filenames.

If your workspace contained:

```
index.html
style.css
script.js
images/
```

then Jenkins would execute something like:

```bash
scp -r index.html style.css script.js images sarah@stapp01:/var/www/html
```

So the disappearance of `*` is **not a bug**.

---

# 2. Then why did the validator complain about "entire repository"?

Because **today** your repository happened to contain only one file:

```
index.html
```

Your deployment technically copied the whole repository because the whole repository was just one file.

So this probably wasn't the validator's issue.

---

# 3. I think the missing `chown` is much more likely

The task explicitly says:

> Before deployment, ensure that the ownership of `/var/www/html` is set to user **sarah**

This sentence exists for a reason.

They want Jenkins to be able to deploy repeatedly.

Suppose ownership changes in the future.

Without:

```bash
sudo chown -R sarah:sarah /var/www/html
```

your deployment could suddenly fail.

The validator often checks whether your job includes this step.

---

# 4. How do you know whether Jenkins is running on the Jenkins server or on App Server 1?

Excellent question.

There are several ways.

---

## Method 1 (Easiest)

Look at the first few lines of the build log.

If you see:

```
Running as SYSTEM

Building in workspace

/var/lib/jenkins/workspace/...
```

that usually means

**the build is running on the Jenkins controller.**

---

If instead you see

```
Running on App Server 1

/home/sarah/jenkins_agent/workspace/...
```

then it is running on an SSH Agent.

---

### Your log says

```
Running as SYSTEM

Building in workspace

/var/lib/jenkins/workspace/...
```

That strongly suggests

> **The build is running on the Jenkins server.**

---

## Method 2

Open Jenkins.

Go to

```
Manage Jenkins

↓

Nodes
```

If you only see

```
Built-In Node
```

then everything runs on Jenkins itself.

---

If you see

```
App Server 1
```

and it is online

then you have an SSH agent.

---

## Method 3

Open the Job.

Look at

```
Restrict where this project can be run
```

If unchecked

↓

runs on Jenkins.

If checked

↓

runs on the specified label.

---

## Method 4

For Pipeline jobs

Look at

```groovy
agent any
```

or

```groovy
agent { label 'stapp01' }
```

---

# 5. Here's the interesting part

You used

```bash
scp
```

Think about it.

If Jenkins is running on

```
Jenkins Server
```

then

```
Jenkins
↓

scp

↓

App Server
```

makes sense.

---

If Jenkins is already running on App Server 1

then

```bash
cp
```

would be enough.

No SSH.

No SCP.

---

# 6. Here's something I'd have checked

From the Jenkins machine:

```bash
pwd
```

or

```bash
hostname
```

inside the Execute Shell.

For example

```bash
hostname

pwd

whoami
```

The console would show something like

```
jenkins

/var/lib/jenkins/workspace/xfusion-app-deployment

jenkins
```

Then you'd immediately know:

> Ah!
>
> Jenkins is executing on the Jenkins server.

This is actually a very common debugging trick.

---

# 7. One thing I would have added to the build step

For learning purposes, I'd temporarily use:

```bash
echo "Current Host:"
hostname

echo "Current User:"
whoami

echo "Workspace:"
pwd

echo "Files:"
ls -la
```

Now your console tells you **exactly**:

* which server is executing
* which user is executing
* what files exist in the workspace

Professional DevOps engineers do this all the time when debugging pipelines.

---

## My conclusion

From everything you've shown, I think the task likely expected something like this in the build step:

```bash
sudo chown -R sarah:sarah /var/www/html

sshpass -p Sarah_pass123 scp -o StrictHostKeyChecking=no -r ./* sarah@stapp01:/var/www/html/

sshpass -p Sarah_pass123 ssh -o StrictHostKeyChecking=no sarah@stapp01 \
"sudo systemctl restart httpd"
```

or an equivalent sequence.

---

I also want to point out something encouraging: compared to a few months ago, you're asking **system-level questions** ("Where is the job actually running?", "Why did the shell expand `*`?", "How do I know where Jenkins executes?"). Those are exactly the kinds of questions that help someone move from following tutorials to understanding how these tools actually work. That's a big step forward.
