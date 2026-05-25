# Day 56: Deploy Nginx Web Server on Kubernetes Cluster

Some of the Nautilus team developers are developing a static website and they want to deploy it on Kubernetes cluster.  
They want it to be highly available and scalable.  
Therefore, based on the requirements, the DevOps team has decided to create a deployment for it with multiple replicas.  
Below you can find more details about it:

1. Create a deployment using nginx image with latest tag only and remember to mention the tag i.e nginx:latest. Name it as nginx-deployment. The container should be named as nginx-container, also make sure replica counts are 3.
2. Create a NodePort type service named nginx-service. The nodePort should be 30011.

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.

<img width="835" height="477" alt="image" src="https://github.com/user-attachments/assets/d5a3fd97-aa03-45a4-be08-097ff7ddcd96" />

```sh
thor@jump-host ~$ vi nginx-deployment.yaml
thor@jump-host ~$ cat nginx-deployment.yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      contaioners:
        - name: nginx-container
          image: nginx:latest
          ports:
            - containerPort: 80
thor@jump-host ~$

thor@jump-host ~$ vi nginx-service.yaml
thor@jump-host ~$ cat nginx-service.yaml 
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  type: NodePort
  selector:
    app: nginx
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30011
thor@jump-host ~$ 

thor@jump-host ~$ kubectl apply -f nginx-deployment.yaml 
Error from server (BadRequest): error when creating "nginx-deployment.yaml": Pod in version "v1" cannot be handled as a Pod: strict decoding error: unknown field "spec.replicas", unknown field "spec.selector", unknown field "spec.template"
thor@jump-host ~$ 

thor@jump-host ~$ vi nginx-deployment.yaml
thor@jump-host ~$ cat nginx-deployment.yaml 
apiVersion: v1
kind: Pod
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx-container
          image: nginx:latest
          ports:
            - containerPort: 80
thor@jump-host ~$ 
thor@jump-host ~$ kubectl apply -f nginx-deployment.yaml 
Error from server (BadRequest): error when creating "nginx-deployment.yaml": Pod in version "v1" cannot be handled as a Pod: strict decoding error: unknown field "spec.replicas", unknown field "spec.selector", unknown field "spec.template"
thor@jump-host ~$

thor@jump-host ~$ vi nginx-deployment.yaml
thor@jump-host ~$ cat nginx-deployment.yaml 
apiVersion: v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx-container
          image: nginx:latest
          ports:
            - containerPort: 80
thor@jump-host ~$ kubectl apply -f nginx-deployment.yaml 
error: resource mapping not found for name: "nginx-deployment" namespace: "" from "nginx-deployment.yaml": no matches for kind "Deployment" in version "v1"
ensure CRDs are installed first
thor@jump-host ~$

thor@jump-host ~$ vi nginx-deployment.yaml
thor@jump-host ~$ cat nginx-deployment.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx-container
          image: nginx:latest
          ports:
            - containerPort: 80
thor@jump-host ~$ kubectl apply -f nginx-deployment.yaml 
deployment.apps/nginx-deployment created
thor@jump-host ~$
thor@jump-host ~$ kubectl apply -f nginx-service.yaml 
service/nginx-service created
thor@jump-host ~$


thor@jump-host ~$ kubectl apply -f nginx-deployment.yaml 
deployment.apps/nginx-deployment created
thor@jump-host ~$ kubectl apply -f nginx-service.yaml 
service/nginx-service created
thor@jump-host ~$ cat nginx-deployment.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx-container
          image: nginx:latest
          ports:
            - containerPort: 80
thor@jump-host ~$ cat nginx-service.yaml 
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  type: NodePort
  selector:
    app: nginx
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30011
thor@jump-host ~$

thor@jump-host ~$ kubectl apply -f nginx-service.yaml 
service/nginx-service unchanged
thor@jump-host ~$

thor@jump-host ~$ kubectl get deployments
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3/3     3            3           2m49s
thor@jump-host ~$ kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
nginx-deployment-6586c5b5fb-cmkm8   1/1     Running   0          2m56s
nginx-deployment-6586c5b5fb-f752v   1/1     Running   0          2m56s
nginx-deployment-6586c5b5fb-plvsw   1/1     Running   0          2m56s
thor@jump-host ~$ kubectl get svc
NAME            TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
kubernetes      ClusterIP   10.43.0.1      <none>        443/TCP        37m
nginx-service   NodePort    10.43.240.40   <none>        80:30011/TCP   2m33s
thor@jump-host ~$

thor@jump-host ~$ kubectl describe deployments.apps 
Name:                   nginx-deployment
Namespace:              default
CreationTimestamp:      Mon, 25 May 2026 15:23:11 +0000
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=nginx
Replicas:               3 desired | 3 updated | 3 total | 3 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=nginx
  Containers:
   nginx-container:
    Image:         nginx:latest
    Port:          80/TCP
    Host Port:     0/TCP
    Environment:   <none>
    Mounts:        <none>
  Volumes:         <none>
  Node-Selectors:  <none>
  Tolerations:     <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   nginx-deployment-6586c5b5fb (3/3 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  3m59s  deployment-controller  Scaled up replica set nginx-deployment-6586c5b5fb from 0 to 3
thor@jump-host ~$

thor@jump-host ~$ kubectl describe svc
Name:                     kubernetes
Namespace:                default
Labels:                   component=apiserver
                          provider=kubernetes
Annotations:              <none>
Selector:                 <none>
Type:                     ClusterIP
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.43.0.1
IPs:                      10.43.0.1
Port:                     https  443/TCP
TargetPort:               6443/TCP
Endpoints:                10.244.240.140:6443
Session Affinity:         None
Internal Traffic Policy:  Cluster
Events:                   <none>


Name:                     nginx-service
Namespace:                default
Labels:                   <none>
Annotations:              <none>
Selector:                 app=nginx
Type:                     NodePort
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.43.240.40
IPs:                      10.43.240.40
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  30011/TCP
Endpoints:                10.22.0.9:80,10.22.0.10:80,10.22.0.11:80
Session Affinity:         None
External Traffic Policy:  Cluster
Internal Traffic Policy:  Cluster
Events:                   <none>
thor@jump-host ~$ 

```

<img width="873" height="442" alt="image" src="https://github.com/user-attachments/assets/e5c8ae1c-d50b-4d9e-b754-e5acce9c3ad4" />

```sh
thor@jump-host ~$ history
    1  vi nginx-deployment.yaml
    2  cat nginx-deployment.yaml
    3  vi nginx-service.yaml
    4  cat nginx-service.yaml 
    5  kubectl apply -f nginx-deployment.yaml 
    6  vi nginx-deployment.yaml
    7  cat nginx-deployment.yaml 
    8  kubectl apply -f nginx-deployment.yaml 
    9  vi nginx-deployment.yaml
   10  cat nginx-deployment.yaml 
   11  kubectl apply -f nginx-deployment.yaml 
   12  vi nginx-deployment.yaml
   13  cat nginx-deployment.yaml 
   14  kubectl apply -f nginx-deployment.yaml 
   15  kubectl apply -f nginx-service.yaml 
   16  cat nginx-deployment.yaml 
   17  cat nginx-service.yaml 
   18  kubectl apply -f nginx-service.yaml 
   19  kubectl get deployments
   20  kubectl get pods
   21  kubectl get svc
   22  kubectl describe deployments.apps 
   23  kubectl describe svc
   24  history
thor@jump-host ~$
```

<img width="1872" height="1146" alt="image" src="https://github.com/user-attachments/assets/ebc191a2-fbfe-4912-96d5-7ff39fb39735" />
<img width="2227" height="1207" alt="image" src="https://github.com/user-attachments/assets/ff91d38d-75fe-4f03-86d7-689994c090a6" />
