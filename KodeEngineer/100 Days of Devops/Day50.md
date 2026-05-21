# Day 50: Set Resource Limits in Kubernetes Pods

[reference 1](https://tundedamian.medium.com/day-50-of-100-days-of-devops-set-resources-limits-in-kubernetes-pods-02c6cb817932)
[reference 2](https://dev.to/wycliffealphus/100-days-of-devops-day-50-3dpk)

The Nautilus DevOps team has noticed performance issues in some Kubernetes-hosted applications due to resource constraints.  
To address this, they plan to set limits on resource utilization. Here are the details:  

Create a pod named httpd-pod with a container named httpd-container. Use the httpd image with the latest tag (specify as httpd:latest).   
Set the following resource limits:  

Requests: Memory: 15Mi, CPU: 100m  

Limits: Memory: 20Mi, CPU: 100m  

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.  


<img width="883" height="425" alt="image" src="https://github.com/user-attachments/assets/2868d18b-bad5-403d-9b8e-da6b972064f7" />

```sh
thor@jump-host ~$ k8resourceDay50.yml
bash: k8resourceDay50.yml: command not found
thor@jump-host ~$ vi k8resourceDay50.yml
thor@jump-host ~$ cat k8resourceDay50.yml 
apiVersion: v1
kind: Pod
metadata:
  name: httpd-pod
spec:
  containers:
    - name: httpd-container
      image: httpd:latest
      resource:
        requests:
          memory: "15Mi"
          cpu: "100m"
        limits:
          memory: "20Mi"
          cpu: "100m"
thor@jump-host ~$


thor@jump-host ~$ kubectl apply -f k8resourceDay50.yml 
Error from server (BadRequest): error when creating "k8resourceDay50.yml": Pod in version "v1" cannot be handled as a Pod: strict decoding error: unknown field "spec.containers[0].resource"
thor@jump-host ~$ vi k8resourceDay50.yml
thor@jump-host ~$ cat k8resourceDay50.yml 
apiVersion: v1
kind: Pod
metadata:
  name: httpd-pod
spec:
  containers:
    - name: httpd-container
      image: httpd:latest
      resources:
        requests:
          memory: "15Mi"
          cpu: "100m"
        limits:
          memory: "20Mi"
          cpu: "100m"
thor@jump-host ~$ kubectl apply -f k8resourceDay50.yml 
pod/httpd-pod created
thor@jump-host ~$



```


<img width="2368" height="1165" alt="image" src="https://github.com/user-attachments/assets/06073bdf-39a6-4fbc-bff9-7c396fa7f60a" />
<img width="2352" height="1177" alt="image" src="https://github.com/user-attachments/assets/265ad805-ff60-42ba-ba79-cf3d0df5325d" />
