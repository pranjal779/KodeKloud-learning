# Lab: Jenkins Installation and Shell Script Project
<img width="1810" height="1021" alt="image" src="https://github.com/user-attachments/assets/3fee9378-4600-4f9d-818a-40ba92f948e1" />

<img width="1997" height="567" alt="image" src="https://github.com/user-attachments/assets/2ef88e89-9538-4a6f-a5ce-769904aa9d65" />
<img width="1012" height="1020" alt="image" src="https://github.com/user-attachments/assets/cb9c7fce-13f4-4f98-8423-d29ec12fb0cd" />
<img width="2496" height="1108" alt="image" src="https://github.com/user-attachments/assets/5cc23100-e0b8-486b-b8e3-92136d88e0ce" />
<img width="981" height="321" alt="image" src="https://github.com/user-attachments/assets/8d379c51-ab59-494d-ab1a-1ba6d90bb80e" />
<img width="1013" height="657" alt="image" src="https://github.com/user-attachments/assets/38f35c0d-f65c-42ec-a088-6a166bac653c" />

```
Navigate to the Jenkins Installer link and follow the provided steps to complete the installation.

You will have to change the default Jenkins port 8080 to 8085 in below file

sudo vi /lib/systemd/system/jenkins.service
Start Jenkins:

sudo systemctl enable jenkins #Enable the Jenkins service to start at boot with the command 
sudo systemctl start jenkins #start the Jenkins service
sudo systemctl status jenkins #check the status of the Jenkins service
Now follow the instruction on screen, install default plugin and change user details
```

<img width="990" height="1130" alt="image" src="https://github.com/user-attachments/assets/8e133e5f-df59-4153-90f6-fe8a0f9896bd" />
```
bob@ubuntu-host ~ ➜  history
    1  sudo apt update
    2  sudo apt install fontconfig openjdk-21-jre
    3  java -version
    4  sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc   https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    5  echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]"   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null
    6  sudo apt update
    7  sudo apt install jenkins
    8  jenkins --version
    9  sudo systemctl enable jenkins
   10  sudo systemctl status jenkins
   11  sudo vi /lib/systemd/system/jenkins.service 
   12  sudo systemctl enable jenkins
   13  sudo systemctl start jenkins
   14  sudo systemctl status jenkins
   15  cat /var/lib/jenkins/secrets/initialAdminPassword
   16  sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   17  history

```

<img width="1037" height="540" alt="image" src="https://github.com/user-attachments/assets/a1213ab0-137c-45b9-8d4c-9c626ad5c675" />
<img width="952" height="1292" alt="image" src="https://github.com/user-attachments/assets/484d38be-a3bf-4306-86d5-3b668cf989e2" />

```

shell script:

#!/bin/bash

# Fetch advice from the API
curl -s https://api.adviceslip.com/advice > advice.json

# Extract advice text
cat advice.json | jq -r .slip.advice > advice.message

# Test to make sure the advice message has more than 5 words
word_count=$(wc -w < advice.message)

if [ $word_count -gt 5 ]; then
  echo "Advice has more than 5 words"
else
  echo "Advice $(cat advice.message) has 5 words or less"
fi

# Deploy cowsay
sudo apt-get install cowsay -y

# Ensure path is correct
echo $PATH
export PATH="$PATH:/usr/games:/usr/local/games"

# Display advice with cowsay
cat advice.message | cowsay -f $(ls /usr/share/cowsay/cows | shuf -n 1)

Configure Sudo to Allow Jenkins User to Run Commands Without a Password

sudo visudo #Open the sudoers file for editing using visudo (to ensure you don't make any syntax mistakes)
jenkins ALL=(ALL) NOPASSWD: ALL #Add the following line to grant the Jenkins user (assuming the Jenkins user is jenkins) permission to run commands without entering a password
Create project using below steps:

Description - Give any based on your preference.
Under Build Steps -> Add build step -> select Execute Shell (Here we will store our shell script)
Save the project.
Now click on Build Now to build the project.
You can see the output of current build under Builds -> Console Output section.
```

<img width="1577" height="852" alt="image" src="https://github.com/user-attachments/assets/0e0b35b8-e6c4-46e5-8566-1641f6c9ec36" />
<img width="1037" height="727" alt="image" src="https://github.com/user-attachments/assets/e28cb6e7-a150-473a-9887-fa7c7c85be1f" />
<img width="740" height="520" alt="image" src="https://github.com/user-attachments/assets/f06cc127-121d-4e0f-b993-da7e6e0ab743" />
<img width="1191" height="595" alt="image" src="https://github.com/user-attachments/assets/0404dcb7-8c6d-4831-8817-52f7b14e9a26" />
<img width="1231" height="736" alt="image" src="https://github.com/user-attachments/assets/c815bc16-ccf6-4be1-a7f9-ce85610682fd" />
<img width="783" height="811" alt="image" src="https://github.com/user-attachments/assets/71675cb4-d23b-4e56-97c8-52978420ce9c" />
<img width="961" height="1117" alt="image" src="https://github.com/user-attachments/assets/1ac6422d-0ebc-4960-8d0b-1f3ee0a27557" />
