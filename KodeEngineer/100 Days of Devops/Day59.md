# Day 59: Troubleshoot Deployment issues in Kubernetes

[reference](https://dev.to/wycliffealphus/100-days-of-devops-day-59-2bi2)

Last week, the Nautilus DevOps team deployed a redis app on Kubernetes cluster, which was working fine so far.  
This morning one of the team members was making some changes in this existing setup, but he made some mistakes and the app went down.  
We need to fix this as soon as possible. Please take a look.  

The deployment name is redis-deployment. The pods are not in running state right now, so please look into the issue and fix the same.  

Note: The kubectl utility on the jump-host has been configured to work with the Kubernetes cluster.   

<img width="852" height="426" alt="image" src="https://github.com/user-attachments/assets/4ab6194e-d079-439b-a61f-44aed899de68" />

```sh

thor@jump-host ~$ ls
thor@jump-host ~$ ls -la
total 28
drwxr-sr-x    1 thor     thor          4096 May 27 18:50 .
drwxr-xr-x    1 root     root          4096 Feb 26 05:36 ..
-rw-r--r--    1 thor     thor            37 Feb 26 05:36 .bash_profile
-rw-r--r--    1 thor     thor           186 Feb 26 05:36 .bashrc
drwxr-sr-x    3 thor     thor          4096 May 27 18:50 .config
drwxr-sr-x    2 thor     thor          4096 May 27 18:21 .kube
thor@jump-host ~$ kubectl get pods
NAME                                READY   STATUS              RESTARTS   AGE
redis-deployment-795ffcb56c-8g6ht   0/1     ContainerCreating   0          116s
thor@jump-host ~$ kubectls get apps
bash: kubectls: command not found
thor@jump-host ~$ kubectls get app
bash: kubectls: command not found
thor@jump-host ~$ kubectls get deploy
bash: kubectls: command not found
thor@jump-host ~$ kubectl logs pods redis-deployment-795ffcb56c-8g6ht
error: error from server (NotFound): pods "pods" not found in namespace "default"
thor@jump-host ~$ kubect describe pods
bash: kubect: command not found
thor@jump-host ~$ kubect describe pod
bash: kubect: command not found
thor@jump-host ~$ kubect describe pod redis-deployment-795ffcb56c-8g6ht
bash: kubect: command not found
thor@jump-host ~$ kubectl describe pod redis-deployment-795ffcb56c-8g6ht
Name:             redis-deployment-795ffcb56c-8g6ht
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.195.107
Start Time:       Wed, 27 May 2026 18:50:09 +0000
Labels:           app=redis
                  pod-template-hash=795ffcb56c
Annotations:      <none>
Status:           Pending
IP:               
IPs:              <none>
Controlled By:    ReplicaSet/redis-deployment-795ffcb56c
Containers:
  redis-container:
    Container ID:   
    Image:          redis:alpin
    Image ID:       
    Port:           6379/TCP
    Host Port:      0/TCP
    State:          Waiting
      Reason:       ContainerCreating
    Ready:          False
    Restart Count:  0
    Requests:
      cpu:        300m
    Environment:  <none>
    Mounts:
      /redis-master from config (rw)
      /redis-master-data from data (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-l8f97 (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   False 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  data:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  config:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      redis-cofig
    Optional:  false
  kube-api-access-l8f97:
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
  Type     Reason       Age                  From               Message
  ----     ------       ----                 ----               -------
  Normal   Scheduled    5m2s                 default-scheduler  Successfully assigned default/redis-deployment-795ffcb56c-8g6ht to jump-host
  Warning  FailedMount  52s (x10 over 5m2s)  kubelet            MountVolume.SetUp failed for volume "config" : configmap "redis-cofig" not found
thor@jump-host ~$

thor@jump-host ~$ kubectl get deploy
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
redis-deployment   0/1     1            0           6m33s
thor@jump-host ~$ kubectl describe deploy
Name:                   redis-deployment
Namespace:              default
CreationTimestamp:      Wed, 27 May 2026 18:50:09 +0000
Labels:                 app=redis
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=redis
Replicas:               1 desired | 1 updated | 1 total | 0 available | 1 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=redis
  Containers:
   redis-container:
    Image:      redis:alpin
    Port:       6379/TCP
    Host Port:  0/TCP
    Requests:
      cpu:        300m
    Environment:  <none>
    Mounts:
      /redis-master from config (rw)
      /redis-master-data from data (rw)
  Volumes:
   data:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
   config:
    Type:          ConfigMap (a volume populated by a ConfigMap)
    Name:          redis-cofig
    Optional:      false
  Node-Selectors:  <none>
  Tolerations:     <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      False   MinimumReplicasUnavailable
  Progressing    True    ReplicaSetUpdated
OldReplicaSets:  <none>
NewReplicaSet:   redis-deployment-795ffcb56c (1/1 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  6m48s  deployment-controller  Scaled up replica set redis-deployment-795ffcb56c from 0 to 1
thor@jump-host ~$



```


```sh
# Please edit the object below. Lines beginning with a '#' will be ignored,               
# and an empty file will abort the edit. If an error occurs while saving this file will be
# reopened with the relevant failures.                          
#                                                               
apiVersion: v1                                                  
kind: Pod                                                       
metadata:                                                       
  creationTimestamp: "2026-05-27T18:50:09Z"                     
  generateName: redis-deployment-795ffcb56c-                    
  generation: 1
#
#
#
#
  metadata:                                                              
      labels:                                                                             
        app: redis                         
    spec:                                 
      containers:                                      
      - image: redis:alpin                                                                                                  
        imagePullPolicy: IfNotPresent      
        name: redis-container              
        ports:                            
        - containerPort: 6379                          
          protocol: TCP                                                                                                     
        resources:                         
          requests:                  
            cpu: 300m                      
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
        volumeMounts:     
        - mountPath: /redis-master-data
          name: data                       
        - mountPath: /redis-master
          name: config                              
      dnsPolicy: ClusterFirst         
      restartPolicy: Always          
      schedulerName: default-scheduler 
      securityContext: {}
      terminationGracePeriodSeconds: 30             
      volumes:                        
      - emptyDir: {}                 
        name: data                     
      - configMap:                    
          defaultMode: 420                          
          name: redis-cofig            
        name: config         
                                        
```

<img width="1853" height="1176" alt="image" src="https://github.com/user-attachments/assets/2029336d-5b73-4e54-aea5-0804968bb827" />
<img width="1897" height="1152" alt="image" src="https://github.com/user-attachments/assets/80343e9e-8122-4536-bc5d-29b77cad1bb5" />

```sh
     volumes:                        
      - emptyDir: {}                 
        name: data                     
      - configMap:                    
          defaultMode: 420                          
          name: redis-config           
        name: config

```

<img width="2392" height="1186" alt="image" src="https://github.com/user-attachments/assets/8cec7d3b-b325-4ddc-a104-a53410941740" />


```sh
thor@jump-host ~$ kubectl delete pod redis-deployment-795ffcb56c-8g6ht 
pod "redis-deployment-795ffcb56c-8g6ht" deleted from default namespace
thor@jump-host ~$ kubectl get pods
NAME                                READY   STATUS              RESTARTS   AGE
redis-deployment-795ffcb56c-vrqdj   0/1     ContainerCreating   0          51s
redis-deployment-85cd7f84f5-rn9cr   0/1     ErrImagePull        0          109s
thor@jump-host ~$
thor@jump-host ~$ kubectl describe deploy
Name:                   redis-deployment
Namespace:              default
CreationTimestamp:      Wed, 27 May 2026 18:50:09 +0000
Labels:                 app=redis
Annotations:            deployment.kubernetes.io/revision: 2
Selector:               app=redis
Replicas:               1 desired | 1 updated | 2 total | 0 available | 2 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=redis
  Containers:
   redis-container:
    Image:      redis:alpin
    Port:       6379/TCP
    Host Port:  0/TCP
    Requests:
      cpu:        300m
    Environment:  <none>
    Mounts:
      /redis-master from config (rw)
      /redis-master-data from data (rw)
  Volumes:
   data:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
   config:
    Type:          ConfigMap (a volume populated by a ConfigMap)
    Name:          redis-config
    Optional:      false
  Node-Selectors:  <none>
  Tolerations:     <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      False   MinimumReplicasUnavailable
  Progressing    True    ReplicaSetUpdated
OldReplicaSets:  redis-deployment-795ffcb56c (1/1 replicas created)
NewReplicaSet:   redis-deployment-85cd7f84f5 (1/1 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  17m    deployment-controller  Scaled up replica set redis-deployment-795ffcb56c from 0 to 1
  Normal  ScalingReplicaSet  2m58s  deployment-controller  Scaled up replica set redis-deployment-85cd7f84f5 from 0 to 1
thor@jump-host ~$
thor@jump-host ~$ kubectl describe pods
Name:             redis-deployment-795ffcb56c-vrqdj
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.195.107
Start Time:       Wed, 27 May 2026 19:05:48 +0000
Labels:           app=redis
                  pod-template-hash=795ffcb56c
Annotations:      <none>
Status:           Pending
IP:               
IPs:              <none>
Controlled By:    ReplicaSet/redis-deployment-795ffcb56c
Containers:
  redis-container:
    Container ID:   
    Image:          redis:alpin
    Image ID:       
    Port:           6379/TCP
    Host Port:      0/TCP
    State:          Waiting
      Reason:       ContainerCreating
    Ready:          False
    Restart Count:  0
    Requests:
      cpu:        300m
    Environment:  <none>
    Mounts:
      /redis-master from config (rw)
      /redis-master-data from data (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-q8fgp (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   False 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  data:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  config:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      redis-cofig
    Optional:  false
  kube-api-access-q8fgp:
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
  Type     Reason       Age                  From               Message
  ----     ------       ----                 ----               -------
  Normal   Scheduled    2m43s                default-scheduler  Successfully assigned default/redis-deployment-795ffcb56c-vrqdj to jump-host
  Warning  FailedMount  35s (x9 over 2m43s)  kubelet            MountVolume.SetUp failed for volume "config" : configmap "redis-cofig" not found


Name:             redis-deployment-85cd7f84f5-rn9cr
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.195.107
Start Time:       Wed, 27 May 2026 19:04:50 +0000
Labels:           app=redis
                  pod-template-hash=85cd7f84f5
Annotations:      <none>
Status:           Pending
IP:               10.22.0.9
IPs:
  IP:           10.22.0.9
Controlled By:  ReplicaSet/redis-deployment-85cd7f84f5
Containers:
  redis-container:
    Container ID:   
    Image:          redis:alpin
    Image ID:       
    Port:           6379/TCP
    Host Port:      0/TCP
    State:          Waiting
      Reason:       ImagePullBackOff
    Ready:          False
    Restart Count:  0
    Requests:
      cpu:        300m
    Environment:  <none>
    Mounts:
      /redis-master from config (rw)
      /redis-master-data from data (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-r7t7r (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  data:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  config:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      redis-config
    Optional:  false
  kube-api-access-r7t7r:
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
  Type     Reason     Age                   From               Message
  ----     ------     ----                  ----               -------
  Normal   Scheduled  3m41s                 default-scheduler  Successfully assigned default/redis-deployment-85cd7f84f5-rn9cr to jump-host
  Normal   Pulling    48s (x5 over 3m40s)   kubelet            Pulling image "redis:alpin"
  Warning  Failed     47s (x5 over 3m39s)   kubelet            Failed to pull image "redis:alpin": rpc error: code = NotFound desc = failed to pull and unpack image "docker.io/library/redis:alpin": failed to resolve reference "docker.io/library/redis:alpin": docker.io/library/redis:alpin: not found
  Warning  Failed     47s (x5 over 3m39s)   kubelet            Error: ErrImagePull
  Normal   BackOff    10s (x13 over 3m38s)  kubelet            Back-off pulling image "redis:alpin"
  Warning  Failed     10s (x13 over 3m38s)  kubelet            Error: ImagePullBackOff
thor@jump-host ~$ 

```

<img width="1338" height="1141" alt="image" src="https://github.com/user-attachments/assets/5481c8bb-7b4c-4406-971c-872689d39608" />

```sh
thor@jump-host ~$ kubectl edit deployment redis-deployment 
deployment.apps/redis-deployment edited
thor@jump-host ~$ kubectl describe pods
Name:             redis-deployment-5476b4ddd6-n8mhd
Namespace:        default
Priority:         0
Service Account:  default
Node:             jump-host/10.244.195.107
Start Time:       Wed, 27 May 2026 19:10:38 +0000
Labels:           app=redis
                  pod-template-hash=5476b4ddd6
Annotations:      <none>
Status:           Running
IP:               10.22.0.10
IPs:
  IP:           10.22.0.10
Controlled By:  ReplicaSet/redis-deployment-5476b4ddd6
Containers:
  redis-container:
    Container ID:   containerd://9078ba596f8ac12740f767443daba0dc90b866ed651279b9a19ecd708c1398a7
    Image:          redis:alpine
    Image ID:       docker.io/library/redis@sha256:ad0a6eff0a40304ab1ab4f50f0dc192d82b071e1094eac961bcb6106092f8a4e
    Port:           6379/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Wed, 27 May 2026 19:10:41 +0000
    Ready:          True
    Restart Count:  0
    Requests:
      cpu:        300m
    Environment:  <none>
    Mounts:
      /redis-master from config (rw)
      /redis-master-data from data (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-fxn6z (ro)
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
  config:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      redis-config
    Optional:  false
  kube-api-access-fxn6z:
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
  Type    Reason     Age    From               Message
  ----    ------     ----   ----               -------
  Normal  Scheduled  2m32s  default-scheduler  Successfully assigned default/redis-deployment-5476b4ddd6-n8mhd to jump-host
  Normal  Pulling    2m31s  kubelet            Pulling image "redis:alpine"
  Normal  Pulled     2m29s  kubelet            Successfully pulled image "redis:alpine" in 2.266s (2.266s including waiting). Image size: 37664818 bytes.
  Normal  Created    2m29s  kubelet            Created container: redis-container
  Normal  Started    2m29s  kubelet            Started container redis-container
thor@jump-host ~$
```

<img width="2396" height="1180" alt="image" src="https://github.com/user-attachments/assets/4d78fdd7-e1a5-4259-9c4a-b77e8225574f" />

```sh
thor@jump-host ~$ kubectl get pods
NAME                                READY   STATUS    RESTARTS   AGE
redis-deployment-5476b4ddd6-n8mhd   1/1     Running   0          3m20s
thor@jump-host ~$ kubectl get deployment redis-deployment 
NAME               READY   UP-TO-DATE   AVAILABLE   AGE
redis-deployment   1/1     1            1           24m
thor@jump-host ~$

```

<img width="2398" height="1191" alt="image" src="https://github.com/user-attachments/assets/70c9eb09-c21e-4fdc-9184-24360d5af55b" />


```sh
thor@jump-host ~$ history
    1  ls
    2  ls -la
    3  kubectl get pods
    4  kubectls get apps
    5  kubectls get app
    6  kubectls get deploy
    7  kubectl logs pods redis-deployment-795ffcb56c-8g6ht
    8  kubect describe pods
    9  kubect describe pod
   10  kubect describe pod redis-deployment-795ffcb56c-8g6ht
   11  kubectl describe pod redis-deployment-795ffcb56c-8g6ht
   12  kubectl get deploy
   13  kubectl describe deploy
   14  kubectl get pods
   15  kubectl edit pods
   16  kubectl edit deployment redis-deployment-795ffcb56c-8g6ht
   17  kubectl edit deploymen
   18  kubectl edit deployment
   19  kubectl edit deployment redis-deployment
   20  kubectl delete pods
   21  kubectl delete pod
   22  kubectl delete pod redis-deployment-
   23  kubectl delete pod redis-deployment-795ffcb56c-8g6ht 
   24  kubectl get pods
   25  kubectl describe deploy
   26  kubectl describe pods
   27  kubectl edit deployment redis-deployment 
   28  kubectl describe pods
   29  kubectl get pods
   30  kubectl get deployment redis-deployment 
   31  history
thor@jump-host ~$
```

<img width="2338" height="1141" alt="image" src="https://github.com/user-attachments/assets/c238cdd3-021e-4ba9-9521-c6eb377b2016" />
<img width="2367" height="1198" alt="image" src="https://github.com/user-attachments/assets/e163bdfc-f3ea-463f-9ede-6c2d7a8c76cf" />
<img width="2411" height="1177" alt="image" src="https://github.com/user-attachments/assets/0ed1e9c6-a530-48c6-82e2-db0837082f24" />
