# Day 64: Fix Python App Deployed on Kubernetes Cluster

[reference 1](https://dev.to/wycliffealphus/100-days-of-devops-day-64-1a08)  
[referenc 2](https://medium.com/@janemils/kodekloud-engineer-day-64-fix-python-app-deployed-on-kubernetes-cluster-a4b7cd6bdea6)

One of the DevOps engineers was trying to deploy a python app on Kubernetes cluster.  
Unfortunately, due to some mis-configuration, the application is not coming up.  
Please take a look into it and fix the issues. Application should be accessible on the specified nodePort.  

The deployment name is python-deployment-devops, its using poroko/flask-demo-app image.  
The deployment and service of this app is already deployed.  

nodePort should be 32345 and targetPort should be python flask app's default port.  

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.  

```sh
thor@jump-host ~$ ls
thor@jump-host ~$ kubectl get deploy
NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
python-deployment-devops   0/1     1            0           3m16s
thor@jump-host ~$ kubectl describe deploy python-deployment-devops 
Name:                   python-deployment-devops
Namespace:              default
CreationTimestamp:      Wed, 03 Jun 2026 15:45:33 +0000
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=python_app
Replicas:               1 desired | 1 updated | 1 total | 0 available | 1 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=python_app
  Containers:
   python-container-devops:
    Image:         poroko/flask-app-demo
    Port:          5000/TCP
    Host Port:     0/TCP
    Environment:   <none>
    Mounts:        <none>
  Volumes:         <none>
  Node-Selectors:  <none>
  Tolerations:     <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      False   MinimumReplicasUnavailable
  Progressing    True    ReplicaSetUpdated
OldReplicaSets:  <none>
NewReplicaSet:   python-deployment-devops-7dd8f6ddf8 (1/1 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  3m43s  deployment-controller  Scaled up replica set python-deployment-devops-7dd8f6ddf8 from 0 to 1
thor@jump-host ~$

thor@jump-host ~$ kubectl get pods
NAME                                        READY   STATUS             RESTARTS   AGE
python-deployment-devops-7dd8f6ddf8-chlpc   0/1     ImagePullBackOff   0          7m21s
thor@jump-host ~$

thor@jump-host ~$ kubectl describe pods
Name:             python-deployment-devops-7dd8f6ddf8-chlpc
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.164.75
Start Time:       Wed, 03 Jun 2026 15:45:33 +0000
Labels:           app=python_app
                  pod-template-hash=7dd8f6ddf8
Annotations:      <none>
Status:           Pending
IP:               10.22.0.9
IPs:
  IP:           10.22.0.9
Controlled By:  ReplicaSet/python-deployment-devops-7dd8f6ddf8
Containers:
  python-container-devops:
    Container ID:   
    Image:          poroko/flask-app-demo
    Image ID:       
    Port:           5000/TCP
    Host Port:      0/TCP
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-vgbpx (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  kube-api-access-vgbpx:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    Optional:                false
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason     Age                     From               Message
  ----     ------     ----                    ----               -------
  Normal   Scheduled  7m53s                   default-scheduler  Successfully assigned default/python-deployment-devops-7dd8f6ddf8-chlpc to jump-host
  Normal   Pulling    4m55s (x5 over 7m52s)   kubelet            Pulling image "poroko/flask-app-demo"
  Warning  Failed     4m54s (x5 over 7m51s)   kubelet            Failed to pull image "poroko/flask-app-demo": failed to pull and unpack image "docker.io/poroko/flask-app-demo:latest": failed to resolve reference "docker.io/poroko/flask-app-demo:latest": pull access denied, repository does not exist or may require authorization: server message: insufficient_scope: authorization failed
  Warning  Failed     4m54s (x5 over 7m51s)   kubelet            Error: ErrImagePull
  Warning  Failed     2m47s (x19 over 7m50s)  kubelet            Error: ImagePullBackOff
  Normal   BackOff    2m24s (x21 over 7m50s)  kubelet            Back-off pulling image "poroko/flask-app-demo"
thor@jump-host ~$

thor@jump-host ~$ kubectl get svc
NAME                    TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
kubernetes              ClusterIP   10.43.0.1      <none>        443/TCP          29m
python-service-devops   NodePort    10.43.93.159   <none>        8080:32345/TCP   10m
thor@jump-host ~$

python-service-devops   NodePort    10.43.93.159   <none>        8080:32345/TCP   10m
thor@jump-host ~$ kubectl edit deployment python-deployment-devops 
deployment.apps/python-deployment-devops edited
thor@jump-host ~$ kubectl get deploy
NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
python-deployment-devops   1/1     1            1           23m
thor@jump-host ~$ kubectl describe deploy
Name:                   python-deployment-devops
Namespace:              default
CreationTimestamp:      Wed, 03 Jun 2026 15:45:33 +0000
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 2
Selector:               app=python_app
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=python_app
  Containers:
   python-container-devops:
    Image:         poroko/flask-demo-app
    Port:          5000/TCP
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
OldReplicaSets:  python-deployment-devops-7dd8f6ddf8 (0/0 replicas created)
NewReplicaSet:   python-deployment-devops-6fdb46f474 (1/1 replicas created)
Events:
  Type    Reason             Age   From                   Message
  ----    ------             ----  ----                   -------
  Normal  ScalingReplicaSet  23m   deployment-controller  Scaled up replica set python-deployment-devops-7dd8f6ddf8 from 0 to 1
  Normal  ScalingReplicaSet  35s   deployment-controller  Scaled up replica set python-deployment-devops-6fdb46f474 from 0 to 1
  Normal  ScalingReplicaSet  27s   deployment-controller  Scaled down replica set python-deployment-devops-7dd8f6ddf8 from 1 to 0
thor@jump-host ~$

thor@jump-host ~$ kubectl get svc
NAME                    TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
kubernetes              ClusterIP   10.43.0.1      <none>        443/TCP          45m
python-service-devops   NodePort    10.43.93.159   <none>        8080:32345/TCP   26m
thor@jump-host ~$ ^C
thor@jump-host ~$ kubectl describe svc python-service-devops 
Name:                     python-service-devops
Namespace:                default
Labels:                   <none>
Annotations:              <none>
Selector:                 app=python_app
Type:                     NodePort
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.43.93.159
IPs:                      10.43.93.159
Port:                     <unset>  8080/TCP
TargetPort:               8080/TCP
NodePort:                 <unset>  32345/TCP
Endpoints:                10.22.0.10:8080
Session Affinity:         None
External Traffic Policy:  Cluster
Internal Traffic Policy:  Cluster
Events:                   <none>
thor@jump-host ~$ kubectl describe svc kubernetes 
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
Endpoints:                10.244.164.75:6443
Session Affinity:         None
Internal Traffic Policy:  Cluster
Events:                   <none>
thor@jump-host ~$

thor@jump-host ~$ kubectl edit svc python-service-devops 
Edit cancelled, no changes made.
thor@jump-host ~$ kubectl edit svc python-service-devops 
service/python-service-devops edited
thor@jump-host ~$ kubectl get svc python-service-devops 
NAME                    TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
python-service-devops   NodePort   10.43.93.159   <none>        8080:32345/TCP   37m
thor@jump-host ~$ kubectl describe svc python-service-devops 
Name:                     python-service-devops
Namespace:                default
Labels:                   <none>
Annotations:              <none>
Selector:                 app=python_app
Type:                     NodePort
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.43.93.159
IPs:                      10.43.93.159
Port:                     <unset>  8080/TCP
TargetPort:               5000/TCP
NodePort:                 <unset>  32345/TCP
Endpoints:                10.22.0.10:5000
Session Affinity:         None
External Traffic Policy:  Cluster
Internal Traffic Policy:  Cluster
Events:                   <none>
thor@jump-host ~$ 


```

<img width="1407" height="1137" alt="image" src="https://github.com/user-attachments/assets/db25fe81-179d-4141-83ec-ca4e240fd9b7" />

<img width="832" height="797" alt="image" src="https://github.com/user-attachments/assets/5edbd59d-0d7c-4424-9e08-d7754e395091" />
<img width="831" height="631" alt="image" src="https://github.com/user-attachments/assets/60ebdc82-dbb2-4489-8add-c1552d7519bf" />

<img width="2168" height="1117" alt="image" src="https://github.com/user-attachments/assets/feab8df7-c311-4a64-bdb6-b85f29012b3e" />
<img width="2307" height="1111" alt="image" src="https://github.com/user-attachments/assets/14519a08-2c47-43af-949f-500bfdc19eb4" />
<img width="660" height="207" alt="image" src="https://github.com/user-attachments/assets/8b9ebc4d-82e5-47f4-90c4-be37f6d42986" />

```sh
thor@jump-host ~$ history
    1  ls
    2  kubectl get deploy
    3  kubectl describe deploy python-deployment-devops 
    4  kubectl get pods
    5  kubectl describe pods
    6  kubect get svc
    7  kubectl get svc
    8  kubectl edit deployment python-deployment-devops 
    9  kubectl get deploy
   10  kubectl describe deploy
   11  kubectl get svc
   12  kubectl describe svc python-service-devops 
   13  kubectl describe svc kubernetes 
   14  kubectl edit svc python-service-devops 
   15  kubectl edit svc python-service-devops 
   16  kubectl get svc python-service-devops 
   17  kubectl describe svc python-service-devops 
   18  history
thor@jump-host ~$
```
<img width="1892" height="1115" alt="image" src="https://github.com/user-attachments/assets/be8e718d-841b-424f-9f00-07f37cdc1272" />
<img width="1940" height="1180" alt="image" src="https://github.com/user-attachments/assets/6fa6f257-60a9-42b3-9d6c-f5734fd3df42" />

