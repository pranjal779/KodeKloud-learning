# Day 48: Deploy Pods in Kubernetes Cluster

<img width="810" height="360" alt="image" src="https://github.com/user-attachments/assets/6e153c72-4fd2-42c3-9aa6-34f78b8c5c6d" />

The Nautilus DevOps team is diving into Kubernetes for application management.  
One team member has a task to create a pod according to the details below:  

Create a pod named pod-httpd using the httpd image with the latest tag. Ensure to specify the tag as httpd:latest.  

Set the app label to httpd_app, and name the container as httpd-container.  

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.  

```sh
thor@jump-host ~$ vi podDay48.yml
thor@jump-host ~$ cat podDay48.yml 
apiVersion: v1
kind: Pod
metadata:
  name: pod-httpd
  label:
    app: httpd_app
spec:
  containers:
    - name: httpd-container
      image: httpd:latest

thor@jump-host ~$ kubectl apply -f podDay48.yml 
Error from server (BadRequest): error when creating "podDay48.yml": Pod in version "v1" cannot be handled as a Pod: strict decoding error: unknown field "metadata.label"
thor@jump-host ~$ vi podDay48.yml
thor@jump-host ~$ cat podDay48.yml 
apiVersion: v1
kind: Pod
metadata:
  name: pod-httpd
  labels:
    app: httpd_app
spec:
  containers:
    - name: httpd-container
      image: httpd:latest

thor@jump-host ~$ kubectl apply -f podDay48.yml 
pod/pod-httpd created
thor@jump-host ~$ kubectl get pods
NAME        READY   STATUS    RESTARTS   AGE
pod-httpd   1/1     Running   0          89s
thor@jump-host ~$ kubectl apply -f podDay48.yml --dry-run=client
pod/pod-httpd configured (dry run)
thor@jump-host ~$ 


```

<img width="2381" height="1041" alt="image" src="https://github.com/user-attachments/assets/1b87d31d-756a-404e-b6c4-94094bd78b72" />
<img width="2395" height="1182" alt="image" src="https://github.com/user-attachments/assets/6aeea84c-8982-44f4-8d55-7accf3ff3a75" />

```sh
thor@jump-host ~$ history
    1  vi podDay48.yml
    2  cat podDay48.yml 
    3  kubectl apply -f podDay48.yml 
    4  vi podDay48.yml
    5  cat podDay48.yml 
    6  kubectl apply -f podDay48.yml 
    7  kubectl get pods
    8  kubectl apply -f podDay48.yml --dry-run=client
    9  history
thor@jump-host ~$

```
