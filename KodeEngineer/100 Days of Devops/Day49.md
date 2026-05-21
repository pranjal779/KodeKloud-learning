# Day 49: Deploy Applications with Kubernetes Deployments

<img width="857" height="823" alt="image" src="https://github.com/user-attachments/assets/ebb14ee5-ebf2-42a6-a0a6-e705dcf76015" />
<img width="840" height="1022" alt="image" src="https://github.com/user-attachments/assets/f48b9d23-061c-4835-a443-9af7c62e0a34" />
<img width="837" height="431" alt="image" src="https://github.com/user-attachments/assets/8d24164f-4fb5-4492-8792-71bed4b6ad2a" />
<img width="1790" height="435" alt="image" src="https://github.com/user-attachments/assets/d721e681-6c32-4d91-a4dc-c2b385cd21a8" />

The Nautilus DevOps team is delving into Kubernetes for app management. One team member needs to create a deployment following these details:  

Create a deployment named nginx to deploy the application nginx using the image nginx:latest (ensure to specify the tag)  

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.  

```sh
thor@jump-host ~$ ls
thor@jump-host ~$ ll
bash: ll: command not found
thor@jump-host ~$ vi deployDay49.yml
thor@jump-host ~$ kubectl create deployment nginx --image=nginx:latest
deployment.apps/nginx created
thor@jump-host ~$ kubectl get deployment
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
nginx   1/1     1            1           103s
thor@jump-host ~$ kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
nginx-7c5d8bf9f7-x8ncr   1/1     Running   0          111s
thor@jump-host ~$ 


thor@jump-host ~$ history
    1  ls
    2  ll
    3  vi deployDay49.yml
    4  kubectl create deployment nginx --image=nginx:latest
    5  kubectl get deployment
    6  kubectl get pods
    7  history
thor@jump-host ~$ 


```

<img width="1863" height="627" alt="image" src="https://github.com/user-attachments/assets/06fedbe9-76da-41e2-b188-2dd603b5afae" />

<img width="1972" height="772" alt="image" src="https://github.com/user-attachments/assets/11979e9f-45b0-4066-8b10-b714ecb354d0" />


