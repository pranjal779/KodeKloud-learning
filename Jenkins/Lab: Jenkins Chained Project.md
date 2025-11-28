# Lab: Jenkins Chained Project
<img width="1813" height="1003" alt="image" src="https://github.com/user-attachments/assets/cb0ffa4c-53f9-40c2-84b3-5fd662fd24ca" />

<img width="1163" height="981" alt="image" src="https://github.com/user-attachments/assets/f872d465-937d-467e-81fe-eab4b09241a1" />

<img width="1075" height="1320" alt="image" src="https://github.com/user-attachments/assets/a85911ad-79bf-4763-b622-36d4ccca2721" />

<img width="1338" height="1377" alt="image" src="https://github.com/user-attachments/assets/1258cccb-3302-43d3-9f1e-a907f40de331" />


Steps

```
Next

2 / 3
Create two new freestyle projects

ascii-build-job
ascii-test-job (this step should get triggered when ascii-build-job is successful)
Below is a sample shell script to use, although you are free to use any script of your choice.


ascii-build-job:

#!/bin/bash

# Fetch advice from the API
curl -s https://api.adviceslip.com/advice > advice.json

# Extract advice text
cat advice.json

ascii-test-job :

#!/bin/bash
ls advice.json
cat advice.json | jq -r .slip.advice > advice.message
# Test to make sure the advice message has more than 5 words
word_count=$(wc -w < advice.message)

if [ $word_count -gt 5 ]; then
  echo "Advice has more than 5 words"
else
  echo "Advice $(cat advice.message) has 5 words or less"
fi

Note: The ascii-test-job pipeline will show error msg in logs as it doesn't have the advice.json artifact, ignore it as we will resolve it in next step.

Jenkins details:

user-name: admin
password : Adm!n321
Jenkins-port: 8085



ascii-build-job job created?

ascii-test-job job created?

```

Solution:

```
Steps to Create and Configure Jenkins Jobs
1. Create ascii-build-job
Open Jenkins and click on "New Item".
Enter "ascii-build-job" as the name and select Freestyle project.
Click OK.
2. Configure ascii-build-job
In the Build Steps, click Add build step → Execute shell.
Copy and paste the following script:
#!/bin/bash

# Fetch advice from the API
curl -s https://api.adviceslip.com/advice > advice.json

# Extract advice text
cat advice.json
Click Save.
3. Create ascii-test-job
Go back to Jenkins Dashboard and click New Item.
Enter "ascii-test-job" as the name and select Freestyle project.
Click OK.
4. Configure ascii-test-job
In the General section, check "This project is parameterized".

Add a File Parameter:

Name: advice.json
Description: "Advice file from ascii-build-job"
In the Build Steps, click Add build step → Execute shell.

Copy and paste the following script:

#!/bin/bash

ls advice.json
cat advice.json | jq -r .slip.advice > advice.message

# Test to make sure the advice message has more than 5 words
word_count=$(wc -w < advice.message)

if [ $word_count -gt 5 ]; then
  echo "Advice has more than 5 words"
else
  echo "Advice $(cat advice.message) has 5 words or less"
fi
Click Save.
5. Set Up Post-Build Trigger in ascii-build-job
Open ascii-build-job.
Click Configure.
Scroll to Post-build Actions and click "Add post-build action" → Build other projects.
Enter ascii-test-job in the Projects to build field.
Choose "Trigger only if build is stable".
Click Save.
```

<img width="1482" height="527" alt="image" src="https://github.com/user-attachments/assets/e78744e1-c030-4d12-a5d1-45014d174025" />

<img width="1887" height="746" alt="image" src="https://github.com/user-attachments/assets/357aabfb-f536-456a-8897-f9ac0588134a" />
<img width="1212" height="1315" alt="image" src="https://github.com/user-attachments/assets/4157b946-17c4-49f9-a440-407ae466b869" />
<img width="1355" height="823" alt="image" src="https://github.com/user-attachments/assets/46c48224-15f7-4ccb-8d45-e2586a265189" />

# Solution for step 3:

```
Installing the Copy Artifact Plugin in Jenkins
The Copy Artifact plugin allows you to transfer files between jobs, resolving the issue where ascii-test-job cannot find advice.json.

Step 1: Install Copy Artifact Plugin
Open Jenkins Dashboard.
Click on Manage Jenkins → Manage Plugins.
Go to the Available tab.
Search for Copy Artifact.
Check the box next to Copy Artifact Plugin and click Install without restart.
Wait for the installation to complete.
Step 2: Update ascii-build-job to Archive Artifacts
Open Jenkins Dashboard → ascii-build-job.
Click Configure.
Scroll to Post-build Actions and click Add post-build action → Archive the artifacts.
In Files to archive, enter:
   advice.json
Click Save.
Step 3: Update ascii-test-job to Copy the Artifact
Open Jenkins Dashboard → ascii-test-job.
Click Configure.
Scroll to Build Environment and check "Copy artifacts from another project".
In the Project name field, enter:
   ascii-build-job
Choose Latest successful build.
In Artifacts to copy, enter:
   advice.json
Click Save.
Step 4: Run ascii-build-job and Trigger ascii-test-job
Go to Jenkins Dashboard.
Click on ascii-build-job.
Click Build Now.
After it runs successfully, go to ascii-test-job and check the build history.
Open the latest build log and verify that advice.json is successfully copied and processed.
```
<img width="1392" height="596" alt="image" src="https://github.com/user-attachments/assets/5e7016f2-bd44-4c06-b946-16d11ebe8cee" />

# Demo: Installing Plugins
# What I missed:

<img width="2323" height="1221" alt="image" src="https://github.com/user-attachments/assets/a84513e2-6314-44e4-92e4-b766a59be2fe" />  
**drag and drop the "Copy Artifacts from another project" on the top in the Build Steps to make sure it take precedence**  
<img width="1978" height="1167" alt="image" src="https://github.com/user-attachments/assets/ab897ff9-c4c1-4cda-9bb0-741bd6ef2aa2" />
<img width="1983" height="1150" alt="image" src="https://github.com/user-attachments/assets/38307d1f-480e-442e-98a9-947594dca3af" />
<img width="1710" height="1148" alt="image" src="https://github.com/user-attachments/assets/65274dde-d039-45e5-b2ca-d80c8615ba86" />


# 4th Job
<img width="1765" height="1050" alt="image" src="https://github.com/user-attachments/assets/369f91de-a1df-4207-b1b0-19cc94b96f6b" />
