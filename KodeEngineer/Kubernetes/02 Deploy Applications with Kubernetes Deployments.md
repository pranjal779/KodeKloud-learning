# Deploy Applications with Kubernetes Deployments

The Nautilus DevOps team is delving into Kubernetes for app management. One team member needs to create a deployment following these details:


Create a deployment named httpd to deploy the application httpd using the image httpd:latest (ensure to specify the tag)

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.

<img width="765" height="267" alt="image" src="https://github.com/user-attachments/assets/cfbea00f-c029-473e-a0d9-2129960cf386" />




To create the requested Kubernetes deployment, run the following imperative command on your jump_host:

kubectl create deployment httpd --image=httpd:latest

------------------------------
## Alternative: YAML Manifest
If you prefer using a YAML file, create a file named deployment.yaml with the following contents:

apiVersion: apps/v1
kind: Deploymentmetadata:
  name: httpd
  labels:
    app: httpdspec:
  replicas: 1
  selector:
    matchLabels:
      app: httpd
  template:
    metadata:
      labels:
        app: httpd
    spec:
      containers:
      - name: httpd
        image: httpd:latest

Apply it using:

kubectl apply -f deployment.yaml

------------------------------
## Verification
To check if the deployment was successfully created, run:

* kubectl get deployments
* kubectl get pods

Would you like to know how to expose this deployment using a service, or add specific resource limits to the container?



```
thor@jump-host ~$ ls
deploy.yaml
thor@jump-host ~$ cat deploy.yaml 
piVersion: apps/v1
kind: Deployment
metadata:
  name: httpd
  labels:
    app: httpd
spec:
  replicas: 1
  selector:
    matchLabels:
      app: httpd
  template:
    metadata:
      labels:
        app: httpd
    spec:
      containers:
        - name: httpd
          image: httpd:latest
thor@jump-host ~$ kubectl apply -f deploy.yaml
error: error validating "deploy.yaml": error validating data: apiVersion not set; if you choose to ignore these errors, turn validation off with --validate=false
thor@jump-host ~$ vi deployment.yaml
thor@jump-host ~$ cat deployment.yaml 
piVersion: apps/v1
kind: Deployment
metadata:
  name: httpd
  labels:
    app: httpd
spec:
  replicas: 1
  selector:
    matchLabels:
      app: httpd
  template:
    metadata:
      labels:
        app: httpd
    spec:
      containers:
        - name: httpd
          image: httpd:latest
thor@jump-host ~$

thor@jump-host ~$ kubectl apply -f deployment.yaml
error: error validating "deployment.yaml": error validating data: apiVersion not set; if you choose to ignore these errors, turn validation off with --validate=false
thor@jump-host ~$ vi deployment.yaml
thor@jump-host ~$ cat deployment.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: httpd
  labels:
    app: httpd
spec:
  replicas: 1
  selector:
    matchLabels:
      app: httpd
  template:
    metadata:
      labels:
        app: httpd
    spec:
      containers:
        - name: httpd
          image: httpd:latest
thor@jump-host ~$ kubectl apply -f deployment.yaml
deployment.apps/httpd created
thor@jump-host ~$

NAME    READY   UP-TO-DATE   AVAILABLE   AGE
httpd   1/1     1            1           37s
thor@jump-host ~$ kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
httpd-6c755866c7-ddm4d   1/1     Running   0          43s
thor@jump-host ~$

```


<img width="2351" height="1153" alt="image" src="https://github.com/user-attachments/assets/f29414cd-f8df-421f-a995-4672f03a0a5b" />
