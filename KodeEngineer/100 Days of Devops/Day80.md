# Day 80: Jenkins Chained Builds


The DevOps team was looking for a solution where they want to restart Apache service on all app servers if the deployment goes fine on these servers in Stratos Datacenter. After having a discussion, they came up with a solution to use Jenkins chained builds so that they can use a downstream job for services which should only be triggered by the deployment job. So as per the requirements mentioned below configure the required Jenkins jobs.

Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and Adm!n321 password.

Similarly you can access Gitea UI on port 3000 (or click the Gitea button) and username and password for Git is sarah and Sarah_pass123 respectively. Under user sarah you will find a repository named web.

Apache is already installed and configured on the app server. The doc root /var/www/html on App Server 1 is a local git repository tracking the origin web repository.

1. Create a Jenkins job named xfusion-app-deployment and configure it to pull changes from the master branch of the web repository on App Server 1 under /var/www/html directory.

2. Create another Jenkins job named manage-services and make it a downstream job for xfusion-app-deployment. Things to take care about this job are:
a. This job should restart httpd service on the app server (App Server 1).
b. Trigger this job only if the upstream job i.e xfusion-app-deployment is stable.

The LB server is already configured. Click on the App button on the top bar to access the app. Please make sure the required content is loading on the main URL (e.g. http://stlb01:8091) i.e there should not be a sub-directory like http://stlb01:8091/web etc.

Note:

1. You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also some times Jenkins UI gets stuck when Jenkins service restarts in the back end so in such case please make sure to refresh the UI page.

2. Make sure Jenkins job passes even on repetitive runs as validation may try to build the job multiple times.

3. Deployment related tasks should be done by sudo user on the destination server to avoid any permission issues so make sure to configure your Jenkins job accordingly.

4. For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.

---


<img width="912" height="1182" alt="image" src="https://github.com/user-attachments/assets/1902a93b-a52d-48e4-9fc8-f973bd173126" />
<img width="911" height="1157" alt="image" src="https://github.com/user-attachments/assets/1e0bd362-1f2e-4465-a9fa-031e8c32bafb" />

<img width="2512" height="780" alt="image" src="https://github.com/user-attachments/assets/f852f38b-6cc6-4789-9fd6-51bfb79d443f" />
<img width="1570" height="791" alt="image" src="https://github.com/user-attachments/assets/616d312b-3b5b-4a19-b6c2-ed6c4c78ee77" />
<img width="697" height="710" alt="image" src="https://github.com/user-attachments/assets/99920246-0ebf-4000-9002-a51fa7550aac" />

<img width="2395" height="1151" alt="image" src="https://github.com/user-attachments/assets/3cd41e53-485e-4903-8a0d-98826bd7ca85" />
<img width="2307" height="1196" alt="image" src="https://github.com/user-attachments/assets/9c4063ee-42bd-4b14-b512-9509bbe50f96" />
<img width="2412" height="1222" alt="image" src="https://github.com/user-attachments/assets/c5617e0b-39b5-4cfb-b1c6-8699cb43a13c" />
<img width="735" height="907" alt="image" src="https://github.com/user-attachments/assets/0cb042b0-2c43-49da-81ec-ec05060d6848" />
<img width="2382" height="1215" alt="image" src="https://github.com/user-attachments/assets/6f6cc73d-6ee0-48c6-9969-ac0fce92de11" />
<img width="2436" height="1226" alt="image" src="https://github.com/user-attachments/assets/07d8533b-be00-45b0-bcff-b55bc1cfc040" />
<img width="2411" height="1191" alt="image" src="https://github.com/user-attachments/assets/6d5215cd-d161-4ec1-abc9-ef648ac1504e" />
<img width="2372" height="1221" alt="image" src="https://github.com/user-attachments/assets/539ec6d4-dea2-46c7-8f1d-2f6e3496c663" />
<img width="2331" height="677" alt="image" src="https://github.com/user-attachments/assets/d3e65a9e-1f75-457e-ab11-be0bda1546b1" />
<img width="2290" height="1162" alt="image" src="https://github.com/user-attachments/assets/2b733c1e-d2d6-4fa0-8541-16ebe02689c5" />


### Create Jenkins Job

<img width="1262" height="617" alt="image" src="https://github.com/user-attachments/assets/8e83cab0-9a24-42c3-9077-2a81d65a1626" />
<img width="1910" height="1151" alt="image" src="https://github.com/user-attachments/assets/993b517d-94ef-41a1-a42a-43b5d32174e0" />
<img width="1877" height="790" alt="image" src="https://github.com/user-attachments/assets/051d0f5f-83df-45e8-9176-81b8b9afbbc5" />
<img width="1921" height="867" alt="image" src="https://github.com/user-attachments/assets/20b7061b-6250-4c60-970e-7bf8470dd72b" />
<img width="2341" height="1222" alt="image" src="https://github.com/user-attachments/assets/1c57303a-1904-486f-af2b-c693e7da5fbe" />
<img width="2215" height="1227" alt="image" src="https://github.com/user-attachments/assets/0b762075-d7ad-4235-b9a6-52b23b28f285" />
<img width="2282" height="1206" alt="image" src="https://github.com/user-attachments/assets/527bdff0-9e08-4b4a-9a3c-67b5867d2def" />
<img width="1880" height="1222" alt="image" src="https://github.com/user-attachments/assets/f9e11541-2f8f-4a1d-b637-253b53f04918" />
<img width="2070" height="1217" alt="image" src="https://github.com/user-attachments/assets/403b8042-926c-467e-ba5d-dcb8b398bb5e" />


```sh
# Execute Shell for nautilus-app-deployment job.
echo 'app-server-password' | sudo -S git config --global --add safe.directory /var/www/html

cd /var/www/html

echo 'app-server-password' | sudo -S git -C /var/www/html pull origin master
```


<img width="2155" height="920" alt="image" src="https://github.com/user-attachments/assets/660479b4-f35e-400a-838f-4d90294a721b" />
<img width="1996" height="1147" alt="image" src="https://github.com/user-attachments/assets/ef5038b5-4918-497f-bb28-0bda24346883" />
<img width="2302" height="1177" alt="image" src="https://github.com/user-attachments/assets/70b7d0a9-e541-4cce-8134-1a0081856c4f" />
<img width="2255" height="1157" alt="image" src="https://github.com/user-attachments/assets/820ceb48-fb1a-47ea-b68f-50fe50c946aa" />
<img width="2526" height="827" alt="image" src="https://github.com/user-attachments/assets/4c4d877b-d6a8-44e0-8a24-0112b7412c9d" />
<img width="2526" height="827" alt="image" src="https://github.com/user-attachments/assets/e5e3ecde-d5d4-46e2-b61c-6bf74a332ffc" />
<img width="1187" height="882" alt="image" src="https://github.com/user-attachments/assets/d5341b00-4a11-47a6-957c-cc58de187442" />
<img width="2542" height="780" alt="image" src="https://github.com/user-attachments/assets/36e2e90a-fa28-4717-a19c-c0995439457c" />


















