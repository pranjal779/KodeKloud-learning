# Day 65: Deploy Redis Deployment on Kubernetes

[reference 1](https://medium.com/@rkasthuri2002/100-days-of-devops-with-kodekloud-my-journey-days-61-to-70-fd80ba5ae2f9)
[reference 2](https://medium.com/@janemils/kodekloud-engineer-day-65-deploy-redis-deployment-on-kubernetes-4300d55ceedd)

The Nautilus application development team observed some performance issues with one of the application that is deployed in Kubernetes cluster.  
After looking into number of factors, the team has suggested to use some in-memory caching utility for DB service.  
After number of discussions, they have decided to use Redis.  
Initially they would like to deploy Redis on kubernetes cluster for testing and later they will move it to production.  
Please find below more details about the task:  

Create a redis deployment with following parameters:  

Create a config map called my-redis-config having maxmemory 2mb in redis-config.  

Name of the deployment should be redis-deployment, it should use  
redis:alpine image and container name should be redis-container. Also make sure it has only 1 replica.  

The container should request for 1 CPU.  

Mount 2 volumes:  

a. An Empty directory volume called data at path /redis-master-data.  
b. A configmap volume called redis-config at path /redis-master.  
c. The container should expose the port 6379.  

Finally, redis-deployment should be up and running.  

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.  


<img width="770" height="770" alt="image" src="https://github.com/user-attachments/assets/14983d06-70bd-4c35-8118-19d17213c4e7" />


To address the requirements for the Redis deployment in your Kubernetes cluster, you can use the following YAML configurations.
1. Create the ConfigMapCreate a file named redis-configmap.yaml:
   ```sh
   apiVersion: v1
   kind: ConfigMap
   metadata:
     name: my-redis-config
   data:
     redis-config: |
       maxmemory 2mb
   ```

2. Create the Redis Deployment
   Create a file named redis-deployment.yaml incorporating the resource requests and volume mounts:
   ```sh
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: redis-deployment
   spec:
     replicas: 1
     selector:
       matchLabels:
         app: redis
     template:
       metadata:
         labels:
           app: redis
       spec:
         containers:
         - name: redis-container
           image: redis:alpine
           resources:
             requests:
               cpu: "1"
           ports:
           - containerPort: 6379
           volumeMounts:
           - name: data
             mountPath: /redis-master-data
           - name: redis-config
             mountPath: /redis-master
         volumes:
         - name: data
           emptyDir: {}
         - name: redis-config
           configMap:
             name: my-redis-config
   ```

3. Apply the configurations
Run the following commands on your jump-host to deploy the resources:
1. Apply the ConfigMap: kubectl apply -f redis-configmap.yaml
2. Apply the Deployment: kubectl apply -f redis-deployment.yaml
3. Verify the status: kubectl get deployments, kubectl get pods



```sh
thor@jump-host ~$ vi configmap.yaml
thor@jump-host ~$ cat configmap.yaml 
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-redis-config
data:
  redis-config: |
    maxmemory 2mb
thor@jump-host ~$




```
<img width="2200" height="1207" alt="image" src="https://github.com/user-attachments/assets/a6b7d728-00ce-49ae-9fc5-fba706ae56c7" />

```sh
thor@jump-host ~$ vi redis-deployment.yaml
thor@jump-host ~$ cat redis-deployment.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: redis
  template:
    metadata:
      labels:
        app: redis
    spec:
      containers:
        - name: redis-container
          image: redis:alpine
          resources:
            requests:
              cpu: "1"
          ports:
            - containerPorts: 6379
          volumeMounts:
            - name: data
              mountPath: /redis-master-data
            - name: redis-config
              moutPath: /redis-master
      volumes:
        - name: data
          emptyDir: {}
        - name: redis-config
          configMap:
            name: my-redis-config
thor@jump-host ~$ 

thor@jump-host ~$ kubectl apply -f configmap.yaml 
configmap/my-redis-config created
thor@jump-host ~$ kubectl apply -f redis-deployment.yaml 
Error from server (BadRequest): error when creating "redis-deployment.yaml": Deployment in version "v1" cannot be handled as a Deployment: strict decoding error: unknown field "spec.template.spec.containers[0].ports[0].containerPorts", unknown field "spec.template.spec.containers[0].volumeMounts[1].moutPath"
thor@jump-host ~$

thor@jump-host ~$ vi redis-deployment.yaml
thor@jump-host ~$ cat redis-deployment.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: redis
  template:
    metadata:
      labels:
        app: redis
    spec:
      containers:
        - name: redis-container
          image: redis:alpine
          resources:
            requests:
              cpu: "1"
          ports:
            - containerPort: 6379
          volumeMounts:
            - name: data
              mountPath: /redis-master-data
            - name: redis-config
              moutPath: /redis-master
      volumes:
        - name: data
          emptyDir: {}
        - name: redis-config
          configMap:
            name: my-redis-config
thor@jump-host ~$ kubectl apply -f redis-deployment.yaml 
Error from server (BadRequest): error when creating "redis-deployment.yaml": Deployment in version "v1" cannot be handled as a Deployment: strict decoding error: unknown field "spec.template.spec.containers[0].volumeMounts[1].moutPath"
thor@jump-host ~$

thor@jump-host ~$ vi redis-deployment.yaml
thor@jump-host ~$ cat redis-deployment.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: redis
  template:
    metadata:
      labels:
        app: redis
    spec:
      containers:
        - name: redis-container
          image: redis:alpine
          resources:
            requests:
              cpu: "1"
          ports:
            - containerPort: 6379
          volumeMounts:
            - name: data
              mountPath: /redis-master-data
            - name: redis-config
              mountPath: /redis-master
      volumes:
        - name: data
          emptyDir: {}
        - name: redis-config
          configMap:
            name: my-redis-config
thor@jump-host ~$ kubectl apply -f redis-deployment.yaml 
deployment.apps/redis-deployment created
thor@jump-host ~$

thor@jump-host ~$ kubectl apply -f redis-deployment.yaml 
deployment.apps/redis-deployment created
thor@jump-host ~$ kubectl get pods
NAME                               READY   STATUS    RESTARTS   AGE
redis-deployment-c795495f4-7tnlc   1/1     Running   0          20s
thor@jump-host ~$ kubectl get deploy
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
redis-deployment   1/1     1            1           27s
thor@jump-host ~$ kubectl get svc
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   80m
thor@jump-host ~$


```

```sh
thor@jump-host ~$ kubectl describe pod redis-deployment-c795495f4-7tnlc 
Name:             redis-deployment-c795495f4-7tnlc
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.13.25
Start Time:       Thu, 04 Jun 2026 02:56:50 +0000
Labels:           app=redis
                  pod-template-hash=c795495f4
Annotations:      <none>
Status:           Running
IP:               10.22.0.9
IPs:
  IP:           10.22.0.9
Controlled By:  ReplicaSet/redis-deployment-c795495f4
Containers:
  redis-container:
    Container ID:   containerd://d1f01cd137e1942b9469d0d5cab6510927d706902c72cc12d0322e80a6169175
    Image:          redis:alpine
    Image ID:       docker.io/library/redis@sha256:09160599abd229764c0fb44cb6be640294e1d360a54b19985ab4843dcf2d90f1
    Port:           6379/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Thu, 04 Jun 2026 02:56:53 +0000
    Ready:          True
    Restart Count:  0
    Requests:
      cpu:        1
    Environment:  <none>
    Mounts:
      /redis-master from redis-config (rw)
      /redis-master-data from data (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-vhtb8 (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  data:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  redis-config:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      my-redis-config
    Optional:  false
  kube-api-access-vhtb8:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    Optional:                false
    DownwardAPI:             true
QoS Class:                   Burstable
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  67s   default-scheduler  Successfully assigned default/redis-deployment-c795495f4-7tnlc to jump-host
  Normal  Pulling    67s   kubelet            Pulling image "redis:alpine"
  Normal  Pulled     65s   kubelet            Successfully pulled image "redis:alpine" in 2.234s (2.234s including waiting). Image size: 37664818 bytes.
  Normal  Created    65s   kubelet            Created container: redis-container
  Normal  Started    65s   kubelet            Started container redis-container
thor@jump-host ~$

thor@jump-host ~$ kubectl describe deploy redis-deployment 
Name:                   redis-deployment
Namespace:              default
CreationTimestamp:      Thu, 04 Jun 2026 02:56:50 +0000
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=redis
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=redis
  Containers:
   redis-container:
    Image:      redis:alpine
    Port:       6379/TCP
    Host Port:  0/TCP
    Requests:
      cpu:        1
    Environment:  <none>
    Mounts:
      /redis-master from redis-config (rw)
      /redis-master-data from data (rw)
  Volumes:
   data:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
   redis-config:
    Type:          ConfigMap (a volume populated by a ConfigMap)
    Name:          my-redis-config
    Optional:      false
  Node-Selectors:  <none>
  Tolerations:     <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   redis-deployment-c795495f4 (1/1 replicas created)
Events:
  Type    Reason             Age   From                   Message
  ----    ------             ----  ----                   -------
  Normal  ScalingReplicaSet  96s   deployment-controller  Scaled up replica set redis-deployment-c795495f4 from 0 to 1
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
Endpoints:                10.244.13.25:6443
Session Affinity:         None
Internal Traffic Policy:  Cluster
Events:                   <none>
thor@jump-host ~$ 


thor@jump-host ~$ kubectl get all
NAME                                   READY   STATUS    RESTARTS   AGE
pod/redis-deployment-c795495f4-7tnlc   1/1     Running   0          2m12s

NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   82m

NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/redis-deployment   1/1     1            1           2m12s

NAME                                         DESIRED   CURRENT   READY   AGE
replicaset.apps/redis-deployment-c795495f4   1         1         1       2m12s
thor@jump-host ~$ 
```

<img width="2452" height="1247" alt="image" src="https://github.com/user-attachments/assets/64525303-990d-448a-a758-0c70954b0b8c" />

```sh
thor@jump-host ~$ history
    1  vi configmap.yaml
    2  cat configmap.yaml 
    3  vi redis-deployment.yaml
    4  cat redis-deployment.yaml 
    5  kubectl appy -f configmap.yaml 
    6  kubectl apply -f configmap.yaml 
    7  kubectl apply -f redis-deployment.yaml 
    8  vi redis-deployment.yaml
    9  cat redis-deployment.yaml 
   10  kubectl apply -f redis-deployment.yaml 
   11  vi redis-deployment.yaml
   12  cat redis-deployment.yaml 
   13  kubectl apply -f redis-deployment.yaml 
   14  kubectl get pods
   15  kubectl get deploy
   16  kubectl get svc
   17  kubectl describe pod redis-deployment-c795495f4-7tnlc 
   18  kubectl describe deploy redis-deployment 
   19  kubectl describe svc
   20  kubectl get all
   21  history
thor@jump-host ~$

```

<img width="2213" height="1155" alt="image" src="https://github.com/user-attachments/assets/4ce13e90-21e3-4cfb-95de-9999e1dce400" />
<img width="2311" height="1141" alt="image" src="https://github.com/user-attachments/assets/e1a44ff1-72ce-426b-a7ab-acf14a64f152" />

