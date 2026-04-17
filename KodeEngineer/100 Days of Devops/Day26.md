# Day 26: Git Manage Remotes

The xFusionCorp development team added updates to the project that is maintained under /opt/games.git repo and cloned under /usr/src/kodekloudrepos/games. 
Recently some changes were made on Git server that is hosted on Storage server in Stratos DC. The DevOps team added some new Git remotes, 
so we need to update remote on /usr/src/kodekloudrepos/games repository as per details mentioned below:

a. In /usr/src/kodekloudrepos/games repo add a new remote dev_games and point it to /opt/xfusioncorp_games.git repository.

b. There is a file /tmp/index.html on same server; copy this file to the repo and add/commit to master branch.

c. Finally push master branch to this new remote origin.

<img width="857" height="658" alt="image" src="https://github.com/user-attachments/assets/3204c02c-ecab-4f80-976b-37c8431a8ae4" />
<img width="827" height="480" alt="image" src="https://github.com/user-attachments/assets/bb0cb275-3054-482c-9e44-dec4853ff016" />

